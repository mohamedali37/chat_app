import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_cubit.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_state.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MsgChat extends StatelessWidget {
  const MsgChat({super.key, required this.message});
  final messageModel message;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Delete',
              desc: 'هل انت متاكد انك تريد الحذف',
              btnCancelOnPress: () {
                Navigator.of(context).pop();
              },
              btnOkOnPress: () async {
                await FirebaseFirestore.instance
                    .collection(kMessagesCollections)
                    .doc(state is ChatSuccessState ? state.messageList[inde])
                    .delete();
              },
            ).show();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, top: 32, bottom: 32, right: 32),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  )),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MsgChatForFriend extends StatelessWidget {
  const MsgChatForFriend({super.key, required this.message});
  final messageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            )),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
