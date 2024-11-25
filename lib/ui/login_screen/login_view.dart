import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/shared_widgets/app_text_form_field.dart';
import '../dialog_utils.dart';
import 'cubit/login_states.dart';
import 'cubit/login_view_model.dart';

class LoginView extends StatefulWidget {

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
       listener: (context, state) {
      if (state is LoginLoadingState) {
        DialogUtils.showLoading(context, 'Waiting');
      }
      else if (state is LoginErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.errorMsg ?? '');
      }
      else if (state is LoginSuccessState) {
        DialogUtils.hideLoading(context);
        CacheHelper.saveData(key: 'token', value: state.response.token);
        CacheHelper.saveData(key: 'name', value: state.response.userEntity?.name);
        CacheHelper.saveData(key: 'email', value: state.response.userEntity?.email);
        Future.delayed(const Duration(seconds: 2),(){
        Navigator.pushNamed(context, Routes.homePageLayout);
        });
      }
    }, child: Scaffold(
      backgroundColor: const Color(0xFF004182),
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
              key: BlocProvider.of<LoginScreenViewModel>(context).formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    fieldText: 'E-mail',
                    hintText: 'enter your email',
                    controller: BlocProvider.of<LoginScreenViewModel>(context).emailController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  AppTextFormField(
                    fieldText: 'Password',
                    hintText: 'enter your password',
                    isObscure: BlocProvider.of<LoginScreenViewModel>(context).isObscure,
                    suffixIcon: InkWell(
                      child: BlocProvider.of<LoginScreenViewModel>(context).isObscure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onTap: () {
                        BlocProvider.of<LoginScreenViewModel>(context).isObscure = !BlocProvider.of<LoginScreenViewModel>(context).isObscure;
                        setState(() {});
                      },
                    ),
                    controller: BlocProvider.of<LoginScreenViewModel>(context).passwordController,
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
              child: SizedBox(
                height: 65.h,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoginScreenViewModel>(context).login();
                    },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signInScreen);
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
