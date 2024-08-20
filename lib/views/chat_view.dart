import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_cubit.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_state.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/views/signin_view.dart';
import 'package:chat_app/widgets/msg_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chat page';

  List<messageModel> messageList = [];

  /*CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);*/
  TextEditingController controller = TextEditingController();

  ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return /*StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('created at', descending: true).snapshots(),
        builder: (context, snapshot) {
          List<messageModel> messageList = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(messageModel.fromjson(snapshot.data!.docs[i]));
            }*/
        Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(SignInView.id, (route) => false);
            }, 
            icon: const Icon(Icons.exit_to_app_outlined)
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if(state is ChatSuccessState) {
                  messageList = state.messageList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: controller2,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? MsgChat(
                              message: messageList[index],
                            )
                          : MsgChatForFriend(message: messageList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(msg: value, email: email);
                controller.clear();
                controller2.animateTo(
                  //controller2.position.maxScrollExtent,
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: GestureDetector(
                    onTap: () {
                      BlocProvider.of<ChatCubit>(context).sendMessage(
                          msg: controller.text.trim(), email: email);
                      controller.clear();
                      controller2.animateTo(
                        //controller2.position.maxScrollExtent,
                        0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    child: const Icon(Icons.send)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
