part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

class LoginSuccessState extends AuthBlocState {}

class LoginLoadingState extends AuthBlocState {}

class LoginFailureState extends AuthBlocState {
   final String err;

  LoginFailureState({required this.err});
}
