import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_bus/data/models/1user_model.dart';
import 'package:h_bus/shared/components/1Tooles/1CustomButton.dart';

import '../../../business_logic/2register/register_cubit.dart';
import '../../../business_logic/2register/register_state.dart';
import '../../../shared/components/1Tooles/4CustomshowToast.dart';
import '../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/colors.dart';
import '../../screens/3wait_screen/wait_view.dart';

class Body_TextForm_View extends StatelessWidget {
  Body_TextForm_View({super.key});
  var NameController = TextEditingController();
  var PhoneController = TextEditingController();
  var countryController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => register_Cubit(),
      child: BlocConsumer<register_Cubit, register_States>(
        listener: (context, state) {
          if (state is AddUserErrorState) {
            // showToast(
            //   text: state.error,
            //   state: ToastStates.ERROR,
            // );
          }
          if (state is AddUserSuccessState) {
            navigateAndFinish(
              context,
              Wait_View(usersModel: register_Cubit.get(context).model!),
            );
            // // print("Email" + state.email.toString());
            // CacheHelper.saveData(
            //   key: 'register',
            //   value: true,
            // ).then((value) {
            //   navigateAndFinish(
            //     context,
            //     Wait_View(),
            //   );
            // });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        // style: TextStyle(fontSize: 15),
                        cursorColor: Color(0xffD6A4DE),

                        controller: NameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'اكتب اسم حضرتك';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'الاسم ',
                          prefixIcon: Icon(
                            Icons.people,
                            color: Color(0xffD6A4DE),
                          ),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Color(0xffD6A4DE),
                          //   ),
                          //   borderRadius: BorderRadius.all(Radius.circular(20)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD6A4DE),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        style: TextStyle(fontSize: 15),
                        cursorColor: ColorManager.defaultRedColor2,
                        controller: PhoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'اكتب رقم الهاتف';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف ',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xffD6A4DE),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD6A4DE),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        style: TextStyle(fontSize: 15),
                        cursorColor: ColorManager.defaultRedColor2,
                        controller: countryController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'اكتب اسم بلدك';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'اسم المدينه ',
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Color(0xffD6A4DE),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD6A4DE),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                    condition: state is! AddUserLoadingSuccessState,
                    fallback: (context) => Center(
                        child: CircularProgressIndicator(
                      color: Color(0xffD6A4DE),
                    )),
                    builder: (context) => Container(
                      // color: Colors.blue,
                      child: CustomAnimatedButton(
                        // ButtonHight: 80,
                        Buttonwidth: 130,
                        backgroundcolor: Color(0xffD6A4DE),
                        shape: BoxShape.rectangle,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            // SocialLoginCubit.get(context).userLogin(
                            //   email: emailController.text,
                            //   password: passwordController.text,
                            // );
                            register_Cubit.get(context).userCreate(
                                name: NameController.text,
                                phone: PhoneController.text,
                                country: countryController.text);
                            // navigateTo(context, Wait_View());
                          }
                        },
                        widget: Text(
                          'تسجيل الدخول',
                          // style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  // // ConditionalBuilder(
                  // //   condition: state is! SocialLoginLoadingState,
                  // //   builder: (context) => Center(
                  // //     child: Padding(
                  // //       padding: const EdgeInsets.only(top: 30),
                  // //       child: Container(
                  // //         width: 110,
                  // //         height: 50,
                  // //         decoration: BoxDecoration(
                  // //           borderRadius: BorderRadius.circular(
                  // //             20.0,
                  // //           ),
                  // //           color: ColorManager.defaultRedColor2,
                  // //         ),
                  // //         child: MaterialButton(
                  // //           onPressed: () {
                  // //             if (formKey.currentState!.validate()) {
                  // //               SocialLoginCubit.get(context).userLogin(
                  // //                 email: emailController.text,
                  // //                 password: passwordController.text,
                  // //               );
                  // //               // navigateTo(
                  // //               //     context,
                  // //               //     HomeExam_Screen(
                  // //               //       UserEmail: "Saad10@gmail.com",
                  // //               //     ));
                  // //             }
                  // //           },
                  // //           child: Text(
                  // //             'تسجيل الدخول',
                  // //             style: TextStyle(fontSize: 13, color: Colors.white),
                  // //           ),
                  // //         ),
                  // //       ),
                  // //     ),
                  // //   ),

                  // //   fallback: (context) => Center(
                  // //       child: CircularProgressIndicator(
                  // //     color: ColorManager.defaultRedColor2,
                  // //   )),
                  // // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
