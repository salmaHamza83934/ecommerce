import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/login_screen/widgets/login_background_circles.dart';
import 'package:ecommerce_app/ui/login_screen/widgets/login_buttons_section.dart';
import 'package:ecommerce_app/ui/login_screen/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../dialog_utils.dart';
import 'cubit/login_states.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context,
              title: 'Error!',
              state.errorMsg ?? '',
              posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context,
              title: 'Logged In successfully!',
              'Welcome,${state.response.userEntity?.name}!',
              posActionName: 'Go To Home', posAction: () {
            Navigator.pushReplacementNamed(context, Routes.homePageLayout);
          });
          CacheHelper.saveData(key: 'token', value: state.response.token);
          CacheHelper.saveData(
              key: 'name', value: state.response.userEntity?.name);
          CacheHelper.saveData(
              key: 'email', value: state.response.userEntity?.email);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const LoginBackgroundCircles(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 200.h),
                    child: Text('Welcome back !',
                        style: AppTextStyles.font24White
                            .copyWith(color: AppColors.magentaHaze)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const LoginFormWidget(),
                  SizedBox(
                    height: 80.h,
                  ),
                  const LoginButtonsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
