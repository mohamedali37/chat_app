import 'package:chat_app/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/widgets/sign_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  SignInView({super.key});
  static String id = 'sign in view';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailureState) {
          ScafoldSnakBar(context, msg: state.err);
          isLoading = false;
        }
      },
      builder: (context,state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Image.asset(
                    kLogo,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      data: (data) {
                        email = data;
                      },
                      hint: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      obscureText: true,
                      data: (data) {
                        password = data;
                      },
                      hint: 'password'),
                  const SizedBox(
                    height: 30,
                  ),
                  SignButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBlocBloc>(context).add(LoginEvent(email: email!, password: password!));
                      }
                    },
                    text: 'Sign In',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account?  ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpView.id);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xffc5e7e8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
