import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/simple_bloc_observer.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/signin_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}


class _ChatAppState extends State<ChatApp> {

  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignUpView.id: (context) => const SignUpView(),
          SignInView.id: (context) => SignInView(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: ( (FirebaseAuth.instance.currentUser != null) && (FirebaseAuth.instance.currentUser!.emailVerified)) ? ChatPage.id : SignInView.id,
      ),
    );
  }
}
