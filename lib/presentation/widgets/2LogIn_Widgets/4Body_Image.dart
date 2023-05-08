import 'dart:async';

import 'package:flutter/material.dart';

import '../../../shared/styles/assets_manager.dart';

class Body_Image_View extends StatefulWidget {
  const Body_Image_View({super.key});

  @override
  State<Body_Image_View> createState() => _Body_Image_ViewState();
}

class _Body_Image_ViewState extends State<Body_Image_View> {
  int activeIndex = 0;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.black,
          height: 200,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: activeIndex == 0 ? 1 : 0,
                duration: Duration(
                  seconds: 1,
                ),
                curve: Curves.linear,
                child: Image(image: AssetImage(ImageAssets.register_Screen1)),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: activeIndex == 1 ? 1 : 0,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
                child: Image(image: AssetImage(ImageAssets.register_Screen2)),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: activeIndex == 2 ? 1 : 0,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
                child: Image(image: AssetImage(ImageAssets.register_Screen3)),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: activeIndex == 3 ? 1 : 0,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
                child: Image(image: AssetImage(ImageAssets.register_Screen4)),
              ),
            )
          ]),
        ),
      ],
    );
  }
}
