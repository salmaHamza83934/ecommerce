import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';

class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{
  String? loadingMsg;

  RegisterLoadingState({this.loadingMsg});
}
class RegisterErrorState extends RegisterStates{
  String? errorMsg;

  RegisterErrorState({this.errorMsg});
}
class RegisterSuccessState extends RegisterStates{
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}