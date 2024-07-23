import 'package:chat_app/models/message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  final List<messageModel> messageList;

  ChatSuccessState({required this.messageList});
}
