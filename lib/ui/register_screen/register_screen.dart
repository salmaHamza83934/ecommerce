import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/register_screen/widgets/register_background_circles.dart';
import 'package:ecommerce_app/ui/register_screen/widgets/register_buttons_section.dart';
import 'package:ecommerce_app/ui/register_screen/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../dialog_utils.dart';
import 'cubit/register_states.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context,
              title: 'Error!',
              state.errorMsg ?? '',
              posActionName: 'Ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context,
              title: 'Account created successfully!',
              'Welcome,${state.response.userEntity?.name}!',
              posActionName: 'Ok', posAction: () {
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          });
          CacheHelper.saveData(
              key: 'name', value: state.response.userEntity?.name);
          CacheHelper.saveData(
              key: 'email', value: state.response.userEntity?.email);
          CacheHelper.saveData(
              key: 'phone',
              value: BlocProvider.of<RegisterScreenViewModel>(context)
                  .mobileNumberController
                  .text);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const RegisterBackgroundCircles(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 150.h),
                    child: Text('Create Your Account',
                        style: AppTextStyles.font24White
                            .copyWith(color: AppColors.magentaHaze)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RegisterFormWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RegisterButtonsSection(),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
