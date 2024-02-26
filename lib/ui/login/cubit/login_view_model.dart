import 'package:ecommerce_app/ui/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/register_usecase.dart';
import 'login_states.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isObscure = true;

  void login() async{
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either=await loginUseCase.invoke(emailController.text, passwordController.text);
      either.fold((l) => emit(LoginErrorState(errorMsg: l.errMsg)), (response) => emit(LoginSuccessState(response: response)));
    }
  }
}
