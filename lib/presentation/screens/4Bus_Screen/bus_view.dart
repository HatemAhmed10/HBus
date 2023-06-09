import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/3wait/wait_cubit.dart';

import '../../../business_logic/4Bus/Bus_cubit.dart';
import '../../../business_logic/4Bus/Bus_state.dart';
import '../../../data/models/1user_model.dart';
import '../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../shared/components/1Tooles/8custom_feding.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../widgets/3bus_widget/1Travels_bod.dart';
import '../3wait_screen/wait_view.dart';

class Bus_View extends StatelessWidget {
  UsersModel usersModel;

  Bus_View({
    required this.usersModel,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Bus_Cubit()
        ..GetInfUser(Id: usersModel.id.toString())
        ..fetchAllTravels(),
      child: BlocConsumer<Bus_Cubit, Bus_States>(listener: (context, state) {
        if (Bus_Cubit.get(context).users!.state == false) {
          CacheHelper.saveData(
            key: 'state',
            value: false,
          ).then((value) {
            navigateAndFinish(
                context,
                Wait_View(
                  usersModel: usersModel,
                ));
          });
        }
      }, builder: (context, state) {
        Bus_Cubit cubit = Bus_Cubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffD6A4DE),
            centerTitle: true,
            title: Text("Bus"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 15, top: 8, left: 8, bottom: 8),
                child: IconButton(
                    onPressed: () {
                      cubit.Call_User("01144630441");
                    },
                    icon: Icon(Icons.call)),
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: state is! TravelsLoadingSuccess,
            fallback: (context) => LoadingListPage(),
            builder: (context) => Center(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Travels_Body(
                  travels: cubit.travels[index],
                  usersModel: usersModel,
                );
              },
              itemCount: cubit.travels.length,
            )),
          ),
        );
      }),
    );
  }
}
