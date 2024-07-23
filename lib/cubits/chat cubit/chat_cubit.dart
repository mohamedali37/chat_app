import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat%20cubit/chat_state.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  void sendMessage({required String msg, required String email}) {
    messages.add({
      'message': msg,
      'created at': DateTime.now(),
      'id': email,
    });
  }

  void getMessage() {
    messages
        .orderBy('created at', descending: true)
        .snapshots()
        .listen((event) {
      List <messageModel> messageList = [];
      for (var msg in event.docs) {
        messageList.add(messageModel.fromjson(msg));
      }
      emit(ChatSuccessState(messageList: messageList));
    });
  }
}
