abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginFailureState extends LoginState {
   final String err;

  LoginFailureState({required this.err});
}