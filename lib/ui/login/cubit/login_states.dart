import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';

class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{
  String? loadingMsg;

  LoginLoadingState({this.loadingMsg});
}
class LoginErrorState extends LoginStates{
  String? errorMsg;

  LoginErrorState({this.errorMsg});
}
class LoginSuccessState extends LoginStates{
  AuthResultEntity response;

  LoginSuccessState({required this.response});
}