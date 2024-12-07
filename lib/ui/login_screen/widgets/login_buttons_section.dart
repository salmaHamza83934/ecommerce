import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../cubit/login_view_model.dart';

class LoginButtonsSection extends StatelessWidget {
  const LoginButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GestureDetector(
            onTap: () {
              if (BlocProvider.of<LoginScreenViewModel>(context)
                  .formKey
                  .currentState!
                  .validate()) {
                BlocProvider.of<LoginScreenViewModel>(context)
                    .login();
              }
            },
            child: Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              color: AppColors.magentaHaze,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log In',
                    style: AppTextStyles.font20MagentaHaze
                        .copyWith(color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signInScreen);
              },
              child: Text(
                'Don’t have an account?',
                style: AppTextStyles.font16DelftBlue.copyWith(
                  color: AppColors.slateGrey,
                ),
                textAlign: TextAlign.start,
              )),
        ),
      ],
    );
  }
}
