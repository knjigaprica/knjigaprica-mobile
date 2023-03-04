import 'package:flutter/material.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../utils/constants/color_pallete.dart';
import '../../../utils/string_extensions.dart';
import 'auth_template.dart';

class RegisterConfirmationScreen extends StatefulWidget {
  const RegisterConfirmationScreen({super.key});

  static const routeName = '/auth-confirmation';

  static const codeLength = 5;

  @override
  State<RegisterConfirmationScreen> createState() =>
      _RegisterConfirmationScreenState();
}

class _RegisterConfirmationScreenState
    extends State<RegisterConfirmationScreen> {
  final List<FocusNode> _focusCodes = [
    for (var i = 0; i < RegisterConfirmationScreen.codeLength; i += 1)
      FocusNode()
  ];
  String code = StringExtensions.generateEmptyString(
      RegisterConfirmationScreen.codeLength);

  void _handleConfirmation() {
    debugPrint(code);
  }

  void _handleCodeFocusChange(String? value, int index) {
    if (value != null && value.isNotEmpty) {
      code = StringExtensions.replaceCharAt(code, index, value);
      if (index + 1 != _focusCodes.length) {
        _focusCodes[index + 1].requestFocus();
      } else {
        _focusCodes[index].unfocus();
        _handleConfirmation();
      }
    } else if (value == null || value.isEmpty) {
      code = StringExtensions.replaceCharAt(code, index, ' ');
      if (index - 1 != -1) {
        _focusCodes[index - 1].requestFocus();
      }
    }
  }

  @override
  void dispose() {
    for (var focusCode in _focusCodes) {
      focusCode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return AuthTemplate(
        body: Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Center(
          child: FractionallySizedBox(
        widthFactor: 0.88,
        child: Column(children: [
          Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      height: 1.4),
                  children: [
                    const TextSpan(
                      text:
                          'Unesi kod za aktivaciju naloga koji je poslat na: ',
                    ),
                    TextSpan(
                        text: email,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ])),
          const SizedBox(
            height: 54,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ..._focusCodes.asMap().entries.map((
                    code,
                  ) =>
                      _CodeField(
                          autofocus: code.key == 0,
                          focusNode: _focusCodes[code.key],
                          onChanged: (value) =>
                              _handleCodeFocusChange(value, code.key)))
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                  text: 'Završi registraciju',
                  onPressed: () => _handleConfirmation()))
        ]),
      )),
    ));
  }
}

class _CodeField extends StatelessWidget {
  const _CodeField(
      {required this.focusNode,
      required this.onChanged,
      this.autofocus = false});

  final FocusNode focusNode;
  final Function(String)? onChanged;
  final bool autofocus;

  InputBorder _buildBorder(Color color, double width) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: width, color: color),
        borderRadius: BorderRadius.circular(8));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
          autofocus: autofocus,
          focusNode: focusNode,
          maxLength: 1,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          cursorColor: Theme.of(context).colorScheme.secondary,
          style: const TextStyle(fontSize: 36),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            hintStyle: const TextStyle(fontSize: 36, color: Color(0xFFEBEEF1)),
            counterText: '',
            hintText: '●',
            fillColor: Colors.white,
            filled: true,
            focusedBorder:
                _buildBorder(Theme.of(context).colorScheme.secondary, 2),
            enabledBorder: _buildBorder(ColorPallete.textFieldBorderColor, 1),
          )),
    );
  }
}
