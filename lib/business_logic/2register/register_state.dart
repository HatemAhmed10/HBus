abstract class register_States {}

class registerInitialState extends register_States {}

class AddUserLoadingSuccessState extends register_States {}

class AddUserSuccessState extends register_States {}

class AddUserErrorState extends register_States {
  final String error;

  AddUserErrorState(this.error);
}
