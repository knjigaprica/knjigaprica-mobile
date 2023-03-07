import 'package:flutter/material.dart';

import '../../../../common_widgets/skeleton.dart';

class SkeletonBookScreen extends StatelessWidget {
  const SkeletonBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Skeleton(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 50,
                    height: double.infinity,
                    child: ColoredBox(color: Colors.white),
                  ),
                  SizedBox(
                    width: 50,
                    height: double.infinity,
                    child: ColoredBox(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            const Expanded(
              flex: 40,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: SizedBox(child: ColoredBox(color: Colors.white)),
              ),
            ),
            const Expanded(flex: 5, child: SizedBox()),
            Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        flex: 25,
                        child: SizedBox(
                          height: double.infinity,
                          child: ColoredBox(color: Colors.white),
                        )),
                    Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                        flex: 30,
                        child: SizedBox(
                          height: double.infinity,
                          child: ColoredBox(color: Colors.white),
                        )),
                    Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                        flex: 25,
                        child: SizedBox(
                          height: double.infinity,
                          child: ColoredBox(color: Colors.white),
                        ))
                  ],
                )),
            const Expanded(flex: 5, child: SizedBox()),
            const Expanded(
                flex: 5,
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ColoredBox(color: Colors.white))),
            const Expanded(flex: 5, child: SizedBox()),
            const Expanded(
                flex: 31,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ColoredBox(color: Colors.white),
                )),
          ],
        ),
      )),
    );
  }
}
