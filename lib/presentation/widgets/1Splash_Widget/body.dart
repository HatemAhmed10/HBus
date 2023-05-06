import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../shared/styles/assets_manager.dart';

class Splash_Body extends StatelessWidget {
  const Splash_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.primary,
      body: Center(
          child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              child: Column(
                children: [
                  FadeInDown(
                      child: Container(
                          height: 400,
                          child: Image(
                              image: AssetImage(ImageAssets.Splash_Screen)))),
                  FadeInUp(
                      child: Text(
                    "HBus",
                    style: TextStyle(
                        color: Color(0xffD6A4DE),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Text("from"),
                  Text(
                    "Youssef",
                    style: TextStyle(
                        color: Color(0xffD6A4DE),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
