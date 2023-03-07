import 'package:flutter/material.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../utils/constants/color_pallete.dart';

class HomeSearchBooks extends StatelessWidget {
  const HomeSearchBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home-search-books-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                ColorPallete.homeScreenSearchBooksBackgroundGradientColor1,
                ColorPallete.homeScreenSearchBooksBackgroundGradientColor2,
              ],
                  stops: [
                0.4,
                1
              ])),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 48,
                ),
                const Text(
                  'Pretraži sve knjige',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 24,
                ),
                PrimaryButton(
                  text: 'Pretraži knjige',
                  onPressed: () {},
                  borderRadius: 8,
                ),
              ]),
        ),
      ),
    );
  }
}
