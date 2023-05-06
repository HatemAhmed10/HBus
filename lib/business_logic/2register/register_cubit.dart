import 'package:h_bus/business_logic/2register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register_Cubit extends Cubit<register_States> {
  register_Cubit() : super(registerInitialState());

  static register_Cubit get(context) => BlocProvider.of(context);
}
