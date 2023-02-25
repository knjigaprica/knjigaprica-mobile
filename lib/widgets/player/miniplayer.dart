import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/marquee.dart';
import '../../providers/player_provider.dart';
import '../../helpers/constants/color_pallete.dart';

class Miniplayer extends StatelessWidget {
  const Miniplayer({super.key});

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<PlayerProvider>(context);
    return Padding(
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
                    player.book != null ? player.book!.title : '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Marquee(
                  child: Text(
                    player.book != null ? player.book!.author : '',
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
          SizedBox(
            width: 40,
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 0,
              child: const Icon(
                Icons.play_arrow,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
