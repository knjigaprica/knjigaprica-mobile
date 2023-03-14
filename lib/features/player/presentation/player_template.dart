import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/player_provider.dart';
import 'miniplayer.dart';

class PlayerTemplate extends StatelessWidget {
  const PlayerTemplate({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(height: double.infinity, child: body),
      Consumer<PlayerProvider>(
        builder: (context, player, child) {
          return const Miniplayer();
        },
      )
    ]);
  }
}
