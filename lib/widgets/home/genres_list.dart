import 'package:flutter/material.dart';

import '../../helpers/constants/color_pallete.dart';
import '../../widgets/home/data_section.dart';

class GenreListModel {
  final String name;
  final IconData icon;

  const GenreListModel({required this.name, required this.icon});
}

class GenresList extends StatelessWidget {
  const GenresList({super.key, required this.title, this.genres = const []});

  final String title;
  final List<GenreListModel> genres;

  int get genresFirstHalfLength {
    return (genres.length / 2).round();
  }

  int get genresSecondHalfLength {
    return genres.length % 2 == 0
        ? genresFirstHalfLength
        : genresFirstHalfLength - 1;
  }

  @override
  Widget build(BuildContext context) {
    return DataSection(
        title: title,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: List.generate(
                            genresFirstHalfLength,
                            (index) => Row(children: [
                                  if (index != 0)
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  _GenreButton(
                                      name: genres[index].name,
                                      icon: genres[index].icon),
                                ]))),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                        children: List.generate(
                            genresSecondHalfLength,
                            (index) => Row(children: [
                                  if (index != 0)
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  _GenreButton(
                                      name:
                                          genres[index + genresSecondHalfLength]
                                              .name,
                                      icon:
                                          genres[index + genresSecondHalfLength]
                                              .icon),
                                ])))
                  ],
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            )));
  }
}

class _GenreButton extends StatelessWidget {
  const _GenreButton({required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorPallete.homeScreenGenreColor),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon),
        const SizedBox(
          width: 8,
        ),
        Text(name, style: const TextStyle(color: Colors.black, fontSize: 24))
      ]),
    );
  }
}
