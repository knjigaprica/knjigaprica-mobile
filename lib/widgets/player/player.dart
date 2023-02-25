import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants/color_pallete.dart';
import '../../providers/player_provider.dart';
import '../../helpers/marquee.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  Widget _buildSpeedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: ColorPallete.playerSpeedButtonColor,
          foregroundColor: ColorPallete.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          textStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () {},
      child: const Text('Brzina 1x'),
    );
  }

  Widget _buildPlayButton() {
    return SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          splashColor: Colors.transparent,
          highlightElevation: 0,
          backgroundColor: ColorPallete.primaryColor,
          child: const Icon(
            Icons.play_arrow,
            size: 40,
          ),
        ));
  }

  Widget _buildChapterButton() {
    return SizedBox(
      height: 60,
      child: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 6,
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
                width: 1, color: ColorPallete.playerChapterButtonBorderColor)),
        label: const Text(
          'Poglavlja',
          style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.2,
              fontWeight: FontWeight.bold,
              color: ColorPallete.secondaryColor),
        ),
        icon: const Icon(CupertinoIcons.list_bullet),
        splashColor: Colors.transparent,
        highlightElevation: 6,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<PlayerProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  IconButton(
                    onPressed: player.collapse,
                    icon: const Icon(CupertinoIcons.chevron_down),
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 26,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 10,
                      color: ColorPallete.miniplayerBoxShadowColor)
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5wB4XU0KtV_bMX0E01U64h7SBgDkpedK7Lg&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: Marquee(
                  child: Text(
                player.book != null ? player.book!.title : '',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: Marquee(
                  child: Text(player.book != null ? player.book!.author : '',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorPallete.playerAuthorTextColor))),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Expanded(
              flex: 3,
              child: Text('Poglavlje 2',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.playerChapterTextColor)),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Text(
                    '1:32',
                    style: TextStyle(
                        color: ColorPallete.playerTimeTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: const SliderThemeData(
                          trackHeight: 5,
                          activeTrackColor: ColorPallete.primaryColor,
                          thumbColor: ColorPallete.secondaryColor,
                          inactiveTrackColor:
                              ColorPallete.playerSliderInactiveColor),
                      child: Slider(
                        value: 0.3,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const Text(
                    '9:20',
                    style: TextStyle(
                        color: ColorPallete.playerTimeTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            Expanded(
              flex: 6,
              child: _buildSpeedButton(),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            Expanded(
              flex: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.backward_end_fill),
                    iconSize: 30,
                  )),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.replay_10),
                      iconSize: 40,
                    ),
                  ),
                  Expanded(child: _buildPlayButton()),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.forward_10),
                      iconSize: 40,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.forward_end_fill),
                      iconSize: 30,
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 5,
              child: SizedBox(),
            ),
            Expanded(
              flex: 8,
              child: _buildChapterButton(),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
          ],
        ));
  }
}
