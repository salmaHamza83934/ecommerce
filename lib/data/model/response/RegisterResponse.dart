
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/data/model/response/Error.dart';
import 'UserDto.dart';


/// message : "success"
/// user : {"name":"salma","email":"salmafghjkl@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzhmMDlhNzIwZWQ2MGIzM2ZmN2YxNSIsIm5hbWUiOiJzYWxtYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAyNDI0NzMxLCJleHAiOjE3MTAyMDA3MzF9.IaRWqnIUnnSYUs0rsyxg7hpI4xGgpxOkIx5jgSlBDac"

class RegisterResponse {
  RegisterResponse({this.message, this.user, this.token, this.statusMsg,this.error});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  String? statusMsg;
  UserDto? user;
  String? token;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }
}
