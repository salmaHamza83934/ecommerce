import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/cach_helper/cach_helper.dart';
import '../../core/shared_widgets/app_text_form_field.dart';
import 'cubit/register_states.dart';
import 'cubit/reigister_view_model.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel,RegisterStates>(
        listener: (context,state){
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
            CacheHelper.saveData(key: 'name', value: state.response.userEntity?.name);
            CacheHelper.saveData(key: 'email', value: state.response.userEntity?.email);
            CacheHelper.saveData(key: 'phone', value: BlocProvider.of<RegisterScreenViewModel>(context).mobileNumberController.text);
            Future.delayed(const Duration(seconds: 2),(){
              Navigator.pushNamed(context, Routes.loginScreen);
            });
          }
    },
    child: Scaffold(
      body: Container(
        color: const Color(0xFF004182),
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
                key: BlocProvider.of<RegisterScreenViewModel>(context).formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      fieldText: 'Full Name',
                      hintText: 'enter your full name',
                      controller: BlocProvider.of<RegisterScreenViewModel>(context).usernameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      fieldText: 'Mobile Number',
                      hintText: 'enter your mobile no.',
                      controller: BlocProvider.of<RegisterScreenViewModel>(context).mobileNumberController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your mobile number';
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      fieldText: 'E-mail address',
                      hintText: 'enter your email address',
                      controller: BlocProvider.of<RegisterScreenViewModel>(context).emailController,
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
                    AppTextFormField(
                      fieldText: 'Password',
                      hintText: 'enter your password',
                      isObscure: BlocProvider.of<RegisterScreenViewModel>(context).isObscure,
                      suffixIcon: InkWell(
                        child: BlocProvider.of<RegisterScreenViewModel>(context).isObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onTap: () {
                          BlocProvider.of<RegisterScreenViewModel>(context).isObscure = !BlocProvider.of<RegisterScreenViewModel>(context).isObscure;
                          setState(() {});
                        },
                      ),
                      controller: BlocProvider.of<RegisterScreenViewModel>(context).passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      fieldText: 'Confirm Password',
                      hintText: 'confirm your password',
                      isObscure: BlocProvider.of<RegisterScreenViewModel>(context).isObscure,
                      suffixIcon: InkWell(
                        child: BlocProvider.of<RegisterScreenViewModel>(context).isObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onTap: () {
                          BlocProvider.of<RegisterScreenViewModel>(context).isObscure = !BlocProvider.of<RegisterScreenViewModel>(context).isObscure;
                          setState(() {});
                        },
                      ),
                      controller: BlocProvider.of<RegisterScreenViewModel>(context).confirmPasswordController,
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
                child: SizedBox(
                  height: 65.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (BlocProvider.of<RegisterScreenViewModel>(context).formKey.currentState?.validate() == true){
                        BlocProvider.of<RegisterScreenViewModel>(context).register();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.font20MagentaHaze,
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
