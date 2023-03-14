import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_pallete.dart';
import '../application/player_provider.dart';

class PlayerSpeed extends StatelessWidget {
  const PlayerSpeed({super.key});

  static const List<double> _speedOptions = [
    0.5,
    0.75,
    1,
    1.25,
    1.5,
    1.75,
    2,
    2.5
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
      child: Column(children: [
        Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.close,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                })),
        const Text(
          'Promeni brzinu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 36,
        ),
        Consumer<PlayerProvider>(
          builder: (context, player, child) => Expanded(
            child: ListView(
                padding: const EdgeInsets.only(bottom: 12),
                physics: const BouncingScrollPhysics(),
                children: _speedOptions
                    .map(
                      (speed) => ListTile(
                        minVerticalPadding: 20,
                        title: Text(
                          '${speed}x',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        trailing: player.speed == speed
                            ? const Icon(
                                Icons.check,
                                color: ColorPallete.playerSpeedsCheckIconColor,
                              )
                            : null,
                        onTap: () => player.setSpeed(speed),
                        splashColor: Colors.transparent,
                      ),
                    )
                    .toList()),
          ),
        )
      ]),
    );
  }
}
