import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/1user_model.dart';
import 'Bus_state.dart';

class Bus_Cubit extends Cubit<Bus_States> {
  Bus_Cubit() : super(BusInitialState());

  static Bus_Cubit get(context) => BlocProvider.of(context);

  UsersModel? users;

  void GetInfUser({required String Id}) {
    emit(GetInfoUserLoadingSuccess());
    FirebaseFirestore.instance.collection('users').doc(Id).get().then((value) {
      users = UsersModel.fromJson(value.data()!);
      emit(GetInfoUserSuccess());
    });
  }
}
