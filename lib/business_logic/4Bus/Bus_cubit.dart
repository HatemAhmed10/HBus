import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/1Travel_Model.dart';
import '../../data/models/1user_model.dart';
import 'Bus_state.dart';

class Bus_Cubit extends Cubit<Bus_States> {
  Bus_Cubit() : super(BusInitialState());

  static Bus_Cubit get(context) => BlocProvider.of(context);
  Timestamp nowDate = Timestamp.now();

  UsersModel? users;

  void GetInfUser({required String Id}) {
    emit(GetInfoUserLoadingSuccess());
    FirebaseFirestore.instance.collection('users').doc(Id).get().then((value) {
      users = UsersModel.fromJson(value.data()!);
      emit(GetInfoUserSuccess());
    });
  }
  //--------------------------------------------------------

  List<TravelModel> travels = [];
  fetchAllTravels() {
    emit(TravelsLoadingSuccess());
    travels.clear();
    FirebaseFirestore.instance
        .collection('Travel')
        .orderBy("date", descending: true)
        .snapshots()
        .listen((event) {
      travels.clear();
      event.docs.forEach((element) {
        String data1 = element
            .data()["date"]
            .toDate()
            .toIso8601String()
            .substring(0, 10)
            .toString();
        String data2 =
            nowDate.toDate().toIso8601String().substring(0, 10).toString();
        if (data1 == data2) {
          travels.add(TravelModel.fromJson(element.data()));
        }
      });
      emit(TravelsSuccess());
    });
  }

  void Call_User(String phoneNumber) async {
    final String telUrl = "tel:${phoneNumber}";

    if (await canLaunch(telUrl)) {
      await launch(telUrl);
    } else {
      throw "Could not launch $telUrl";
    }
    emit(CallUserState());
  }
}
