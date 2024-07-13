import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/home_screen/home_screen_view.dart';
import 'package:ecommerce_app/ui/login/cubit/login_states.dart';
import 'package:ecommerce_app/ui/login/cubit/login_view_model.dart';
import 'package:ecommerce_app/ui/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_widgets/custom_text_form_field.dart';
import '../dialog_utils.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'login_view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginScreenViewModel viewModel = LoginScreenViewModel(
      loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel, listener: (context, state) {
      if (state is LoginLoadingState) {
        DialogUtils.showLoading(context, 'Waiting');
      }
      else if (state is LoginErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.errorMsg ?? '');
      }
      else if (state is LoginSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.response.userEntity?.name ?? '');
        Navigator.pushNamed(context, HomeView.routeName);
      }
    }, child: Scaffold(
      backgroundColor: Color(0xFF004182),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 85.h, left: 95.w, right: 95.w, bottom: 85.h),
              child: Image.asset('assets/images/route.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text('Welcome back to route',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text('please sign in with your email',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    fieldText: 'E-mail',
                    hintText: 'enter your email',
                    controller: viewModel.emailController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Enter your email';
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
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget password?',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 60.h, left: 16.w, right: 16.w, bottom: 10.h),
              child: Container(
                height: 65.h,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.login();
                    },
                  child: Text(
                    'Log in',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterView.routeName);
                  },
                  child: Text(
                    'Don’t have an account? Create Account',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
