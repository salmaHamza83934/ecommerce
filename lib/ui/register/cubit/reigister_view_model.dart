import 'package:ecommerce_app/ui/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/register_usecase.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase regiserUseCase;

  RegisterScreenViewModel({required this.regiserUseCase})
      : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var mobileNumberController = TextEditingController();
  bool isObscure = true;

  void register() async{
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either=await regiserUseCase.invoke(usernameController.text, passwordController.text,
          confirmPasswordController.text, emailController.text, mobileNumberController.text);
      either.fold((l) => emit(RegisterErrorState(errorMsg: l.errMsg)), (response) => emit(RegisterSuccessState(response: response)));
    }
  }
}
