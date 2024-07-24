import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        try {
          // ignore: unused_local_variable
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
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
    });
  }
}
