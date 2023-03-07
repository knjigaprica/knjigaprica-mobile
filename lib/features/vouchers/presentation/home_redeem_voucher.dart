import 'package:flutter/material.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../utils/constants/color_pallete.dart';

class HomeRedeemVoucher extends StatelessWidget {
  const HomeRedeemVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home-voucher-background.png'),
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
                ColorPallete.homeScreenVaucherBackgroundGradientColor1,
                ColorPallete.homeScreenVaucherBackgroundGradientColor2,
              ])),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                'assets/logo/logo-icon.png',
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Kupili ste vaučer?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Aktivirajte ga i slušaj svoje knjige.',
                      style: TextStyle(
                          color:
                              ColorPallete.homeScreenVaucherSecondaryTextColor,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryButton(
                      text: 'Aktiviraj vaučer',
                      onPressed: () {},
                      borderRadius: 8,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
