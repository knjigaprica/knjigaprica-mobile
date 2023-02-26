import 'package:flutter/material.dart';

class PlayerChapters extends StatelessWidget {
  const PlayerChapters({super.key});

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
          'Pogljavlja',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}
