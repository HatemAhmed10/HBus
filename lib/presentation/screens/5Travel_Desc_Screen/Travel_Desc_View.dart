import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_bus/data/models/1user_model.dart';
import 'package:h_bus/shared/components/1Tooles/4CustomshowToast.dart';
import '../../../business_logic/5Travel_Desc/travel_desc_cubit.dart';
import '../../../business_logic/5Travel_Desc/travel_desc_state.dart';
import '../../../data/models/1Travel_Model.dart';
import '../../../shared/components/1Tooles/1CustomButton.dart';
import '../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/5Travel_widget/1user_list.dart';

class Travel_Desc_View extends StatelessWidget {
  final TravelModel travels;
  final UsersModel usersModel;

  Travel_Desc_View({
    super.key,
    required this.travels,
    required this.usersModel,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Travel_Desc_Cubit()
        ..checkAdd(travelModel: travels, usermodel: usersModel),
      child: BlocConsumer<Travel_Desc_Cubit, Travel_Desc_States>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffD6A4DE),
              centerTitle: true,
              title: Row(
                children: [
                  Spacer(),
                  Text(travels.Time.toString()),
                  Spacer(),
                  Text(travels.country.toString()),
                  Spacer(),
                  Text('ج ${travels.salary.toString()}'),
                  Spacer(),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! deleteUserLoadingSuccess,
              fallback: (context) => LoadingListPage(),
              builder: (context) => Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        // color: Colors.yellow,
                        width: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${travels.userBus!.length} / ${travels.usersnumber}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // color: Colors.blue,
                              height: 340,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return User_List(
                                    travels2: travels,
                                    travels: travels.userBus!,
                                    index: index,
                                  );
                                },
                                itemCount: travels.userBus!.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    travels.userBus!.length ==
                            int.parse(travels.usersnumber.toString())
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              // color: Colors.blue,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    "لا يوجد مكان في هذه العربيه",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xff669E76),
                                    ),
                                  ),
                                  Spacer(),
                                  CustomAnimatedButton(
                                    function: () {
                                      if (Travel_Desc_Cubit.get(context).add ==
                                          false) {
                                        showToast(
                                            text: "انت غير مسجل",
                                            state: ToastStates.SUCCESS);
                                      } else {
                                        Travel_Desc_Cubit.get(context)
                                            .deleteUser(
                                                travelModel: travels,
                                                usermodel: usersModel);
                                        Travel_Desc_Cubit.get(context).checkAdd(
                                            travelModel: travels,
                                            usermodel: usersModel);
                                        print(
                                            travels.userBus!.length.toString());
                                        print(Travel_Desc_Cubit.get(context)
                                            .add
                                            .toString());
                                        showToast(
                                            text: "تم الحذف ",
                                            state: ToastStates.SUCCESS);
                                      }
                                    },
                                    widget: Text("حذف"),
                                    ButtonHight: 80,
                                    Buttonwidth: 80,
                                    backgroundcolor: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            // child: Text(
                            //   "لا يوجد مكان في هذه العربيه",
                            //   style: TextStyle(
                            //     fontSize: 25,
                            //     color: Color(0xff669E76),
                            //   ),
                            // ),
                          )
                        : Expanded(
                            flex: 1,
                            child: Container(
                              // color: Colors.blue,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      CustomAnimatedButton(
                                        function: () {
                                          if (Travel_Desc_Cubit.get(context)
                                                  .add ==
                                              false) {
                                            showToast(
                                                text: "انت غير مسجل",
                                                state: ToastStates.SUCCESS);
                                          } else {
                                            Travel_Desc_Cubit.get(context)
                                                .deleteUser(
                                                    travelModel: travels,
                                                    usermodel: usersModel);
                                            Travel_Desc_Cubit.get(context)
                                                .checkAdd(
                                                    travelModel: travels,
                                                    usermodel: usersModel);
                                            print(travels.userBus!.length
                                                .toString());
                                            print(Travel_Desc_Cubit.get(context)
                                                .add
                                                .toString());
                                            showToast(
                                                text: "تم الحذف ",
                                                state: ToastStates.SUCCESS);
                                          }
                                        },
                                        widget: Text("حذف"),
                                        ButtonHight: 80,
                                        Buttonwidth: 80,
                                        backgroundcolor: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      Spacer(),
                                      CustomAnimatedButton(
                                        function: () {
                                          if (Travel_Desc_Cubit.get(context)
                                                  .add ==
                                              false) {
                                            Travel_Desc_Cubit.get(context)
                                                .AddUser(
                                                    travelModel: travels,
                                                    usermodel: usersModel);
                                            Travel_Desc_Cubit.get(context)
                                                .checkAdd(
                                                    travelModel: travels,
                                                    usermodel: usersModel);

                                            showToast(
                                                text: "تم اضافتك ",
                                                state: ToastStates.SUCCESS);
                                          } else {
                                            showToast(
                                                text: "تم اضافتك ",
                                                state: ToastStates.SUCCESS);
                                          }
                                        },
                                        widget: Text("اضافه"),
                                        ButtonHight: 80,
                                        Buttonwidth: 80,
                                        backgroundcolor: Color(0xffD6A4DE),
                                        shape: BoxShape.circle,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
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
