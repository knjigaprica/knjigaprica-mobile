import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';
import '../../widgets/player/player.dart';
import '../../helpers/constants/color_pallete.dart';
import '../../providers/player_provider.dart';
import '../player/miniplayer.dart';
import '../shared/navigation.dart';

class PlayerTemplate extends StatelessWidget {
  const PlayerTemplate({super.key, required this.body});

  static const double maxPlayerWidth = 350;

  final Widget body;

  Offset _getPlayerOffset(PlayerState playerState) {
    switch (playerState) {
      case PlayerState.expanded:
        return const Offset(0, 0);
      case PlayerState.collapsed:
        return const Offset(0, -0.3);
      case PlayerState.closed:
        return const Offset(0, 1);
    }
  }

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
                builder: (context, player, child) => AnimatedSlide(
                  curve: Curves.easeInOutBack,
                  offset: _getPlayerOffset(player.state),
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        if (player.isExpanded) {
                          player.collapse();
                        } else {
                          player.close();
                        }
                      } else {
                        if (player.state == PlayerState.collapsed) {
                          player.expand();
                        }
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
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
                      child: AnimatedSwitcher(
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        duration: const Duration(milliseconds: 300),
                        child: player.isExpanded
                            ? const Player()
                            : const Miniplayer(),
                      ),
                    ),
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
