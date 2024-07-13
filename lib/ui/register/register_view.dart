import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_widgets/custom_text_form_field.dart';
import 'cubit/register_states.dart';
import 'cubit/reigister_view_model.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'signup_view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterScreenViewModel viewModel =RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel,RegisterStates>(
        bloc: viewModel,listener: (context,state){
          if(state is RegisterLoadingState){
            DialogUtils.showLoading(context, 'Waiting');
          }
          else if(state is RegisterErrorState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMsg??'');
          }
          else if(state is RegisterSuccessState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.response.userEntity?.name??'');
          }
    },
    child: Scaffold(
      body: Container(
        color: Color(0xFF004182),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 85.h, left: 95.w, right: 95.w, bottom: 50.h),
                child: Image.asset('assets/images/route.png'),
              ),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      fieldText: 'Full Name',
                      hintText: 'enter your full name',
                      controller: viewModel.usernameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      fieldText: 'Mobile Number',
                      hintText: 'enter your mobile no.',
                      controller: viewModel.mobileNumberController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your mobile number';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      fieldText: 'E-mail address',
                      hintText: 'enter your email address',
                      controller: viewModel.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your email';
                        }
                        final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'invalid email';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      fieldText: 'Password',
                      hintText: 'enter your password',
                      isObsecure: viewModel.isObscure,
                      suffixIcon: InkWell(
                        child: viewModel.isObscure
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onTap: () {
                          viewModel.isObscure = !viewModel.isObscure;
                          setState(() {});
                        },
                      ),
                      controller: viewModel.passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      fieldText: 'Confirm Password',
                      hintText: 'confirm your password',
                      isObsecure: viewModel.isObscure,
                      suffixIcon: InkWell(
                        child: viewModel.isObscure
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onTap: () {
                          viewModel.isObscure = !viewModel.isObscure;
                          setState(() {});
                        },
                      ),
                      controller: viewModel.confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h,left: 16.w,right: 16.w,bottom: 20.h),
                child: Container(
                  height: 65.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (viewModel.formKey.currentState?.validate() == true){
                        viewModel.register();
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
