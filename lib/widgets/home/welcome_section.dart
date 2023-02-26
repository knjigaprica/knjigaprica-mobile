import 'package:flutter/material.dart';

import '../../widgets/home/extended_book_list.dart';
import '../../helpers/constants/color_pallete.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  String get welcomeMessage {
    var currentDate = DateTime.now();

    if (currentDate.hour >= 5 && currentDate.hour <= 11) {
      return 'Dobro jutro';
    } else if (currentDate.hour >= 19 || currentDate.hour < 5) {
      return 'Dobro veče';
    } else {
      return 'Dobar dan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          ColorPallete.backgroundGradientColor1,
          ColorPallete.backgroundGradientColor2,
        ],
      )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            welcomeMessage,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 34, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const Divider(
          endIndent: 24,
          indent: 24,
          height: 1,
          color: ColorPallete.homeScreenWelcomeSectionDividerColor,
        ),
        const SizedBox(
          height: 32,
        ),
        const ExtendedBookList(title: 'Nastavi slušanje')
      ]),
    );
  }
}
