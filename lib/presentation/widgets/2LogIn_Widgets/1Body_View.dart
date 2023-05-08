import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/2register/register_cubit.dart';
import '../../../business_logic/2register/register_state.dart';
import '../../../shared/styles/colors.dart';
import '2Body_Text.dart';
import '3Body_TextForm.dart';
import '4Body_Image.dart';

class LogIn_Body extends StatelessWidget {
  LogIn_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => register_Cubit(),
      child: BlocBuilder<register_Cubit, register_States>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.yellow,
                      child: const Body_Image_View(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.blue,
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: const Body_Text_View(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.red,
                      child: Body_TextForm_View(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
