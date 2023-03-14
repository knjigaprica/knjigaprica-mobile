import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/marquee.dart';
import '../../../common_widgets/play_button.dart';
import '../../../utils/constants/color_pallete.dart';
import '../application/player_provider.dart';
import 'player.dart';

class Miniplayer extends StatelessWidget {
  const Miniplayer({super.key});

  static const double _maxMiniplayerWidth = 350;

  double _getMiniplayerWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return min(width, _maxMiniplayerWidth);
  }

  void _openPlayer(BuildContext context, PlayerProvider playerProvider) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => ListenableProvider.value(
        value: playerProvider,
        child: const Player(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<PlayerProvider>(context);
    return GestureDetector(
      onTap: () {
        _openPlayer(context, player);
      },
      child: Container(
        width: _getMiniplayerWidth(context),
        height: 74,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: ColorPallete.miniplayerBorder),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 8),
                  color: ColorPallete.miniplayerBoxShadowColor)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 54,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5wB4XU0KtV_bMX0E01U64h7SBgDkpedK7Lg&usqp=CAU',
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Marquee(
                      child: Text(
                        player.book == null ? '' : player.book!.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Marquee(
                      child: Text(
                        player.book == null ? '' : player.book!.author,
                        style: const TextStyle(
                            fontSize: 14,
                            color: ColorPallete.playerAuthorTextColor),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              PlayButton(
                onPressed: () {},
                variant: PlayButtonVariant.darkTone,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
