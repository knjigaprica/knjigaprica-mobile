import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:knjigaprica/common_widgets/primary_button.dart';
import 'package:knjigaprica/utils/constants/color_pallete.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverPersistentHeader(
            delegate: _BookOverviewAppBar(expandedHeight: 500),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 2000,
          )),
        ]),
      ),
    );
  }
}

class _BookOverviewAppBar extends SliverPersistentHeaderDelegate {
  const _BookOverviewAppBar({required this.expandedHeight});

  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: ColorPallete.bookScreenBorderColor)),
          ),
          width: double.infinity,
          margin: EdgeInsets.only(
              top: kToolbarHeight *
                  getCollapsePercentage(shrinkOffset, boost: 1.3),
              left: 24 * getCollapsePercentage(shrinkOffset),
              right: 24 * getCollapsePercentage(shrinkOffset)),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 52,
                child: Opacity(
                  opacity: getCollapsePercentage(shrinkOffset, boost: 1.3),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            color: Color.fromARGB(255, 221, 219, 219))
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
              const Expanded(flex: 4, child: SizedBox()),
              SizedBox(
                height: kToolbarHeight - 1,
                child: Center(
                  child: Text(
                    'Velika borba',
                    style: TextStyle(
                        fontSize: 18 + getCollapsePercentage(shrinkOffset) * 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 13,
                child: Opacity(
                  opacity: getCollapsePercentage(shrinkOffset, boost: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Flexible(
                              child: Text('Autor',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                          FittedBox(
                              child: Text('Zigfrid Vitver',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPallete.primaryColor)))
                        ],
                      )),
                      const VerticalDivider(
                        thickness: 1,
                        color: ColorPallete.bookScreenBorderColor,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Flexible(
                                child: Text(
                              'Izdavač',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )),
                            Flexible(
                                child: Text('Laguna',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.primaryColor)))
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Flexible(
                                child: Text('Trajanje',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                            Flexible(
                                child: Text('2h:09m',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.primaryColor)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 14,
                child: Opacity(
                  opacity: getCollapsePercentage(shrinkOffset, boost: 10),
                  child: PrimaryButton(
                    text: 'Poslušaj demo',
                    onPressed: () {},
                    borderRadius: 8,
                    color: ColorPallete.secondaryColor,
                  ),
                ),
              ),
              const Expanded(flex: 7, child: SizedBox()),
            ],
          ),
        ),
        SizedBox(
          height: kToolbarHeight - 1,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            Row(children: [
              Opacity(
                opacity: getCollapsePercentage(shrinkOffset, boost: 1.5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share_outlined),
                ),
              ),
              Opacity(
                opacity: getCollapsePercentage(shrinkOffset, boost: 1.5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                ),
              ),
              Opacity(
                  opacity: 1 - getCollapsePercentage(shrinkOffset, boost: 0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                  )),
            ]),
          ]),
        ),
      ],
    );
  }

  double getCollapsePercentage(double shrinkOffset, {double boost = 1}) {
    double fullPercetage = 1 - (shrinkOffset * boost) / (maxExtent - minExtent);

    return max(0, fullPercetage);
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
