import '../../../domain/entities/auth_result_entity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"salma","email":"salmafghjkl@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzhmMDlhNzIwZWQ2MGIzM2ZmN2YxNSIsIm5hbWUiOiJzYWxtYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAyNTEyMjg1LCJleHAiOjE3MTAyODgyODV9.4Br6NpzBImYWM6VdrcMbt8HjRF41cJZRFr6Omo-Nm_0"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,
    this.statusMsg
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg=json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['statusMsg'] = statusMsg;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }

}

/// name : "salma"
/// email : "salmafghjkl@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}