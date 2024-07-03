// ignore: camel_case_types
class messageModel{
  final String message;
  final String id;
  messageModel(this.id, {required this.message});
  factory messageModel.fromjson(json){
    return messageModel(message: json['message'] , json['id']);
  }
}