import 'package:firebase_auth/firebase_auth.dart';

class Messages {
  String? messageId;
  String? message;
  String? registrationTime;

  Messages({this.messageId, this.message, this.registrationTime});

  //get data
  factory Messages.fromMap(map) {
    return Messages(
      messageId: map['messageId'],
      message: map['message'],
      registrationTime: map['registrationTime'],
    );
  }

  //send data
  Map<String, dynamic> toMap() {
    return {
      'message_id': messageId,
      'message': message,
      'registrationTime': registrationTime,
    };
  }
}
