import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/3wait/wait_cubit.dart';
import '../../../business_logic/3wait/wait_state.dart';
import '../../../data/models/1user_model.dart';
import '../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/assets_manager.dart';
import '../4Bus_Screen/bus_view.dart';

class Wait_View extends StatelessWidget {
  UsersModel usersModel;

  Wait_View({
    required this.usersModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          wait_Cubit()..GetInfUser(Id: usersModel.id.toString()),
      child: BlocConsumer<wait_Cubit, wait_States>(
        listener: (context, state) {
          if (wait_Cubit.get(context).users!.state == true) {
            print("Dada");
            CacheHelper.saveData(
              key: 'state',
              value: true,
            ).then((value) {
              navigateAndFinish(
                  context,
                  Bus_View(
                    usersModel: usersModel,
                  ));
            });
          }
        },
        builder: (context, state) {
          wait_Cubit cubit = wait_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("HBus"),
              backgroundColor: Color(0xffD6A4DE),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 400,
                      child:
                          Image(image: AssetImage(ImageAssets.Wait_Screen1))),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "${usersModel.name} انتظر موافقه المسؤل",
                    style: TextStyle(fontSize: 25, color: Color(0xffD6A4DE)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
