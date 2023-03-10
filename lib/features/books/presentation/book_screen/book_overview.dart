import 'dart:math';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../utils/constants/color_pallete.dart';

class BookOverview extends SliverPersistentHeaderDelegate {
  const BookOverview({required this.expandedHeight});

  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                indent: getCollapsePercentage(shrinkOffset) * 24,
                endIndent: getCollapsePercentage(shrinkOffset) * 24,
                thickness: 1,
                height: 1,
                color: ColorPallete.bookScreenBorderColor,
              )),
          Padding(
            padding: EdgeInsets.only(
                top: kToolbarHeight * getCollapsePercentage(shrinkOffset)),
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 53,
                  child: Opacity(
                    opacity: getCollapsePercentage(shrinkOffset, boost: 1.3),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 10),
                              color: ColorPallete.bookScreenImageShadowColor)
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                              'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/Velika%20borba%20korica.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 5, child: SizedBox()),
                SizedBox(
                  height: kToolbarHeight - 1,
                  child: Center(
                    child: Text(
                      'Velika borba',
                      style: TextStyle(
                          fontSize:
                              18 + getCollapsePercentage(shrinkOffset) * 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Expanded(flex: 45, child: SizedBox()),
              ],
            ),
          ),
          Opacity(
            opacity: getCollapsePercentage(shrinkOffset, boost: 2),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: 30 * getCollapsePercentage(shrinkOffset),
                    left: 24,
                    right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Column(
                            children: const [
                              Text('Autor',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Zigfrid Vitver',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPallete.primaryColor))
                            ],
                          )),
                          const VerticalDivider(
                            thickness: 1,
                            color: ColorPallete.bookScreenBorderColor,
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                Text(
                                  'Izdavač',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('Laguna',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.primaryColor))
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            color: ColorPallete.bookScreenBorderColor,
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                Text('Trajanje',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('2h:09m',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.primaryColor))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32 * getCollapsePercentage(shrinkOffset),
                    ),
                    PrimaryButton(
                      text: 'Poslušaj demo',
                      onPressed: () {},
                      borderRadius: 8,
                      color: ColorPallete.secondaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: kToolbarHeight - 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Row(children: [
                    Opacity(
                      opacity: getExpandedActionsOpacity(shrinkOffset),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.ios_share_outlined),
                      ),
                    ),
                    Opacity(
                      opacity: getExpandedActionsOpacity(shrinkOffset),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                      ),
                    ),
                    if (getCollapsePercentage(shrinkOffset) <= 0.5)
                      Opacity(
                          opacity: getMiniPlayButtonOpacity(shrinkOffset),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                          )),
                  ]),
                ]),
          ),
        ],
      ),
    );
  }

  double getMiniPlayButtonOpacity(double shrinkOffset) {
    double collapsePercentage = getCollapsePercentage(shrinkOffset);

    if (collapsePercentage > 0.5) {
      return 0;
    }

    return (0.5 - collapsePercentage) * 2;
  }

  double getExpandedActionsOpacity(double shrinkOffset) {
    if (getCollapsePercentage(shrinkOffset) <= 0.5) {
      return 0;
    }

    return getCollapsePercentage(shrinkOffset, boost: 2);
  }

  double getCollapsePercentage(double shrinkOffset, {double boost = 1}) {
    return max(0, 1 - (shrinkOffset * boost) / (maxExtent - minExtent));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
