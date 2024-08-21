// ignore: camel_case_types
class messageModel{
  final String message;
  final String email;
  final String id;
  messageModel(this.email, this.id, {required this.message});
  factory messageModel.fromjson(json){
    return messageModel(message: json['message'] , json['email'], json['id']);
  }
}