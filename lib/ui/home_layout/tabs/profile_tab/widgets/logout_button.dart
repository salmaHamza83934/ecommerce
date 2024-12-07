import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cach_helper/cach_helper.dart';
import '../../../../../core/routing/routes_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dialog_utils.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
            color: AppColors.magentaHaze,
            borderRadius: BorderRadius.circular(16.r)),
        width: 200.w,
        height: 50.h,
        child: GestureDetector(
          onTap: () {
            DialogUtils.showMessage(
                context, 'Are you sure you want to logout?',
                title: 'Log Out?',
                negActionName: 'Stay',
                posActionName: 'Yes, Log out', posAction: () {
              Navigator.pushReplacementNamed(
                  context, Routes.onboardingScreen);
              CacheHelper.clearAllData();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log Out',
                  style: AppTextStyles.font16DelftBlue
                      .copyWith(color: Colors.white)),
              SizedBox(
                width: 15.w,
              ),
              const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
