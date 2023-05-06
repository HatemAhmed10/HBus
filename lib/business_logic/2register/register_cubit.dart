import 'package:h_bus/business_logic/2register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';
import '../../data/models/1user_model.dart';
import '../../shared/components/constants.dart';

class register_Cubit extends Cubit<register_States> {
  register_Cubit() : super(registerInitialState());

  static register_Cubit get(context) => BlocProvider.of(context);
  UsersModel? model;
  void userCreate({
    required String name,
    required String phone,
    required String country,
  }) {
    emit(AddUserLoadingSuccessState());

    var uId = FirebaseFirestore.instance.collection('Users').doc();

    model = UsersModel(
        id: uId.id, name: name, phone: phone, country: country, state: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId.id)
        .set(model!.toMap())
        .then((value) async {
      var notesBox = Hive.box<UsersModel>(kUsersBox);
      await notesBox.add(model!);
      emit(AddUserSuccessState());
    }).catchError((error) {
      emit(AddUserErrorState(error.toString()));
    });
  }
}
