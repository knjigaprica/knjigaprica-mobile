import 'package:flutter/material.dart';

class HomeHorizontalBookTimeList extends StatelessWidget {
  const HomeHorizontalBookTimeList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
