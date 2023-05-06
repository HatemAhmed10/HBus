import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_bus/business_logic/3wait/wait_state.dart';

import '../../data/models/1user_model.dart';

class wait_Cubit extends Cubit<wait_States> {
  wait_Cubit() : super(waitInitialState());

  static wait_Cubit get(context) => BlocProvider.of(context);

  UsersModel? users;

  void GetInfUser({required String Id}) {
    emit(GetInfoUserLoadingSuccess());
    FirebaseFirestore.instance.collection('users').doc(Id).get().then((value) {
      users = UsersModel.fromJson(value.data()!);
      emit(GetInfoUserSuccess());
    });
  }
}
