import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/navigation/application/navigation_provider.dart';
import '../../../utils/constants/color_pallete.dart';
import '../../navigation/presentation/navigation.dart';
import '../application/player_provider.dart';
import 'miniplayer.dart';
import 'player.dart';

class PlayerTemplate extends StatelessWidget {
  const PlayerTemplate({super.key, required this.body});

  static const double maxPlayerWidth = 350;

  final Widget body;

  double _getPlayerWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return min(width, maxPlayerWidth);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NavigationProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => PlayerProvider(),
          ),
        ],
        child: SafeArea(
          child: Scaffold(
            body: Stack(alignment: Alignment.bottomCenter, children: [
              body,
              Consumer<PlayerProvider>(
                builder: (context, player, child) => GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      if (player.isExpanded) {
                        player.collapse();
                      }
                    } else if (!player.isExpanded) {
                      player.expand();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: player.isExpanded ? 0 : 20),
                    width: player.isExpanded
                        ? MediaQuery.of(context).size.width
                        : _getPlayerWidth(context),
                    height: player.isExpanded
                        ? MediaQuery.of(context).size.height
                        : 74,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: ColorPallete.miniplayerBorder),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8,
                              offset: Offset(0, 8),
                              color: ColorPallete.miniplayerBoxShadowColor)
                        ]),
                    child:
                        player.isExpanded ? const Player() : const Miniplayer(),
                  ),
                ),
              )
            ]),
            bottomNavigationBar: Consumer<PlayerProvider>(
              builder: (context, player, child) =>
                  player.isExpanded ? const SizedBox() : child!,
              child: const Navigation(),
            ),
          ),
        ));
  }
}
