import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/styles/colors.dart';
import '2Body_Text.dart';
import '3Body_TextForm.dart';
import '4Body_Image.dart';

class LogIn_Body extends StatelessWidget {
  LogIn_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                // color: Colors.yellow,
                child: const Body_Image_View(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.blue,
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: const Body_Text_View(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.red,
                child: Body_TextForm_View(),
              ),
            ),

            // const SizedBox(
            //   height: 30.0,
            // ),
          ],
        ),
      ),
    );
  }
}
