import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/auth/email_screen.dart';
import '../../widgets/shared/auth_layout.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  static const routeName = '/auth-social';

  void _handleGoogleAuth() {}

  void _handleFacebookAuth() {}

  void _handleEmailAuth(BuildContext context) {
    Navigator.of(context).pushNamed(EmailScreen.routeName);
  }

  Widget _buildAuthButton(
      BuildContext context, Widget icon, String label, VoidCallback onPressed) {
    return SizedBox(
        height: 60,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            side: const BorderSide(
              color: Color(0XFFDDDAE8),
              width: 1,
            ),
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(label)
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        hasBackButton: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
              child: FractionallySizedBox(
            widthFactor: 0.88,
            child: Column(children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Image.asset(
                  'assets/logo/logo-full.png',
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                "Dobrodošli",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              _buildAuthButton(
                  context,
                  SvgPicture.asset("assets/svgs/google-icon.svg"),
                  "Nastavi sa Google nalogom",
                  _handleGoogleAuth),
              const SizedBox(
                height: 8,
              ),
              _buildAuthButton(
                  context,
                  SvgPicture.asset("assets/svgs/facebook-icon.svg"),
                  "Nastavi sa Facebook nalogom",
                  _handleFacebookAuth),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D8D8),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'ili',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D8D8),
                  )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _buildAuthButton(
                  context,
                  const Icon(
                    Icons.email_outlined,
                    weight: 2,
                  ),
                  "Nastavi koristeći Email",
                  () => _handleEmailAuth(context)),
            ]),
          )),
        ));
  }
}
