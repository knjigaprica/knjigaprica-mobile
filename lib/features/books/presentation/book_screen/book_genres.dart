import 'package:flutter/material.dart';

import '../../../../utils/constants/color_pallete.dart';

class BookGenres extends StatelessWidget {
  const BookGenres({super.key, required this.genres});

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Žanrovi',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 24,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              genres.map((genre) => _BookGenresItem(genre: genre)).toList(),
        )
      ],
    );
  }
}

class _BookGenresItem extends StatelessWidget {
  const _BookGenresItem({required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorPallete.bookScreenGenreColor),
      child: Text(
        genre,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}
