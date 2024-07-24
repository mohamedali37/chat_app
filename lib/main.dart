import 'package:chat_app/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/signin_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBlocBloc()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignUpView.id: (context) => const SignUpView(),
          SignInView.id: (context) => SignInView(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: SignInView.id,
      ),
    );
  }
}
