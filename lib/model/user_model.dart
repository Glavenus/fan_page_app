import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? role;
  String? firstName;
  String? lastName;
  String? registrationTime;

  UserModel(
      {this.uid,
      this.email,
      this.role,
      this.firstName,
      this.lastName,
      this.registrationTime});

  //get data
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      registrationTime: map['registrationTime'],
    );
  }

  //send data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'firstName': firstName,
      'lastName': lastName,
      'registrationTime': registrationTime,
    };
  }
}
