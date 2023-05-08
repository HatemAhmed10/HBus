import 'package:flutter/material.dart';

class Body_Text_View extends StatelessWidget {
  const Body_Text_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ادخل الان لحجز عربتك",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "bold",
            color: Color(0xffD6A4DE),
          ),
        ),
        // Text(
        //   "ادخل الان لحجز عربتك",
        //   style: TextStyle(
        //     fontFamily: "bold",
        //   ),
        // ),
      ],
    );
  }
}
