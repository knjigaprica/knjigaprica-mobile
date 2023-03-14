import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_pallete.dart';
import '../../../utils/duration_extensions.dart';
import '../application/player_provider.dart';

class PlayerChapters extends StatelessWidget {
  const PlayerChapters({super.key});

  static const _chaptersHeightPercentage = 0.8;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * _chaptersHeightPercentage,
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
          'Poglavlja',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 48,
        ),
        Consumer<PlayerProvider>(
          builder: (context, player, child) {
            var chapters = player.book!.chapters;

            return Expanded(
              child: Material(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: chapters.length,
                  padding: const EdgeInsets.only(bottom: 12),
                  itemBuilder: (context, index) => InkResponse(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      player.setChapter(chapters[index].id);
                    },
                    splashFactory: NoSplash.splashFactory,
                    highlightShape: BoxShape.rectangle,
                    child: Container(
                      decoration: BoxDecoration(
                          color: chapters[index].isSelected
                              ? ColorPallete.playerChaptersSelectedChapterColor
                              : null,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(12),
                      child: Row(children: [
                        Expanded(
                            child: Text(
                          chapters[index].name,
                          style: const TextStyle(fontSize: 18),
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          DurationExtensions.formatTimeWithOptionalHour(
                              chapters[index].duration),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
