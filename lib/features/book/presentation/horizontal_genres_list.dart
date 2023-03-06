import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common_widgets/skeleton.dart';
import '../../../utils/constants/color_pallete.dart';

class HorizontalGenresListItemModel {
  final String name;
  final IconData icon;

  const HorizontalGenresListItemModel({required this.name, required this.icon});
}

class HorizontalGenresList extends StatelessWidget {
  const HorizontalGenresList(
      {super.key,
      required this.title,
      this.genres = const [],
      this.isLoading = false});

  final String title;
  final bool isLoading;
  final List<HorizontalGenresListItemModel> genres;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
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
                        children: isLoading
                            ? List.generate(
                                3,
                                (index) => Row(children: [
                                      if (index != 0)
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      const Skeleton(
                                          child:
                                              _HorizontalGenresListLoadingitem()),
                                    ]))
                            : List.generate(
                                genresFirstHalfLength,
                                (index) => Row(children: [
                                      if (index != 0)
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      _HorizontalGenresListitem(
                                          name: genres[index].name,
                                          icon: genres[index].icon),
                                    ]))),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                        children: isLoading
                            ? List.generate(
                                3,
                                (index) => Row(children: [
                                      if (index != 0)
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      const Skeleton(
                                          child:
                                              _HorizontalGenresListLoadingitem()),
                                    ]))
                            : List.generate(
                                genresSecondHalfLength,
                                (index) => Row(children: [
                                      if (index != 0)
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      _HorizontalGenresListitem(
                                          name: genres[index +
                                                  genresSecondHalfLength]
                                              .name,
                                          icon: genres[index +
                                                  genresSecondHalfLength]
                                              .icon),
                                    ])))
                  ],
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            )),
      ],
    );
  }
}

class _HorizontalGenresListitem extends StatelessWidget {
  const _HorizontalGenresListitem({required this.name, required this.icon});

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
        Text(name,
            style: const TextStyle(
                color: ColorPallete.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500))
      ]),
    );
  }
}

class _HorizontalGenresListLoadingitem extends StatelessWidget {
  const _HorizontalGenresListLoadingitem();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorPallete.homeScreenGenreColor),
      width: Random().nextDouble() * 50 + 100,
      height: 58,
    );
  }
}
