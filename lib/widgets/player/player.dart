import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knjigaprica/widgets/player/player_chapters.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants/color_pallete.dart';
import '../../providers/player_provider.dart';
import '../../helpers/marquee.dart';
import '../../widgets/player/player_speed.dart';

class Player extends StatelessWidget {
  const Player({super.key});

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
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
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
                          fontWeight: FontWeight.w500,
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
                      fontWeight: FontWeight.w500,
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
                        fontWeight: FontWeight.w500),
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
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            const Expanded(
              flex: 6,
              child: _SpeedButton(),
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
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        splashFactory: NoSplash.splashFactory,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    onPressed: () {},
                    child: const Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                  )),
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
            const Expanded(
              flex: 8,
              child: _ChaptersButton(),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
          ],
        ));
  }
}

class _SpeedButton extends StatelessWidget {
  const _SpeedButton();

  void _openSpeedSheet(BuildContext context, PlayerProvider player) {
    showModalBottomSheet(
      barrierColor: const Color.fromARGB(85, 0, 0, 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      context: context,
      isScrollControlled: true,
      builder: (context) => ListenableProvider.value(
        value: player,
        child: const PlayerSpeed(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<PlayerProvider>(context, listen: false);
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
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onPressed: () => _openSpeedSheet(context, player),
      child: const Text('Brzina 1x'),
    );
  }
}

class _ChaptersButton extends StatelessWidget {
  const _ChaptersButton();

  void _openChaptersSheet(BuildContext context, PlayerProvider player) {
    showModalBottomSheet(
      barrierColor: const Color.fromARGB(85, 0, 0, 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      context: context,
      isScrollControlled: true,
      builder: (context) => ListenableProvider.value(
        value: player,
        child: const PlayerChapters(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<PlayerProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 8),
                color: ColorPallete.miniplayerBoxShadowColor)
          ]),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            backgroundColor: Colors.white,
            foregroundColor: ColorPallete.secondaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(
                    color: ColorPallete.playerChapterButtonBorderColor))),
        onPressed: () => _openChaptersSheet(context, player),
        label: const Text(
          'Poglavlja',
          style: TextStyle(
              fontSize: 16, letterSpacing: 0.2, fontWeight: FontWeight.w500),
        ),
        icon: const Icon(CupertinoIcons.list_bullet),
      ),
    );
  }
}
