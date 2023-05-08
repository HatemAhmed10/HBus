import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_bus/business_logic/5Travel_Desc/travel_desc_state.dart';
import 'package:h_bus/shared/components/1Tooles/4CustomshowToast.dart';

import '../../data/models/1Travel_Model.dart';
import '../../data/models/1user_model.dart';

class Travel_Desc_Cubit extends Cubit<Travel_Desc_States> {
  Travel_Desc_Cubit() : super(Travel_DescInitialState());

  static Travel_Desc_Cubit get(context) => BlocProvider.of(context);

  bool add = false;

  void checkAdd({
    required TravelModel travelModel,
    required UsersModel usermodel,
  }) {
    if (travelModel.userBus!.length == 0) {
      add = false;
    } else {
      if (travelModel.userBus == null) {
        add = false;
      } else {
        for (int x = 0; x < travelModel.userBus!.length; x++) {
          travelModel.userBus![x]["id"].toString() == usermodel.id.toString()
              ? add = true
              : add = false;
        }
      }
    }

    emit(CheckAddState());
  }

  void deleteUser(
      {required TravelModel travelModel, required UsersModel usermodel}) async {
    // print(travelModel.userBus.toString());
    if (travelModel.userBus == null) {
      showToast(text: "انت غير مسجل", state: ToastStates.SUCCESS);
    } else {
      for (int x = 0; x < travelModel.userBus!.length; x++) {
        travelModel.userBus![x]["id"].toString() == usermodel.id.toString()
            ? travelModel.userBus!.removeAt(x)
            : add = false;
      }
    }
    // print(travelModel.userBus!.toString());

    // travelModel.userBus!.removeAt(index);
    emit(deleteUserLoadingSuccess());

    TravelModel travelModel2 = TravelModel(
        id: travelModel.id,
        Time: travelModel.Time,
        country: travelModel.country,
        date: travelModel.date,
        salary: travelModel.salary,
        usersnumber: travelModel.usersnumber,
        userBus: travelModel.userBus);

    await FirebaseFirestore.instance
        .collection('Travel')
        .doc(travelModel.id)
        .update(travelModel2.toMap());
    emit(deleteUserState());
  }

  void AddUser({
    required TravelModel travelModel,
    required UsersModel usermodel,
  }) async {
    emit(AddUserLoadingSuccess());

    travelModel.userBus!.add({
      "country": usermodel.country,
      "name": usermodel.name,
      "phone": usermodel.phone,
      "id": usermodel.id
    });

    TravelModel travelModel2 = TravelModel(
      id: travelModel.id,
      country: travelModel.country,
      Time: travelModel.Time,
      date: travelModel.date,
      salary: travelModel.salary,
      usersnumber: travelModel.usersnumber,
      userBus: travelModel.userBus,
    );
    await FirebaseFirestore.instance
        .collection('Travel')
        .doc(travelModel2.id)
        .update(travelModel2.toMap());
    emit(AddUserState());
  }
}
