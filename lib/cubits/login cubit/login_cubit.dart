import 'package:chat_app/cubits/login%20cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailureState(err: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailureState(err: 'wrong-password'));
      }
    } catch (e) {
      emit(LoginFailureState(err: e.toString()));
    }
  }
}
