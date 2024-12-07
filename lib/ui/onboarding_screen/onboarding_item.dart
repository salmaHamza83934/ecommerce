import 'package:ecommerce_app/ui/onboarding_screen/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

Widget onBoardingItem(OnboardingModel model, context) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(
        height: 450.h,
        width: 350.w,
        child: Image.asset(
          model.image,
          fit: BoxFit.contain,
        )),
    Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: AppTextStyles.font24White.copyWith(
              color: AppColors.magentaHaze,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            model.description,
            style: AppTextStyles.font16DelftBlue.copyWith(
              color: AppColors.slateGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ],
);
