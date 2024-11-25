import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class PriceAndCheckoutLine extends StatelessWidget {
  String price;


  PriceAndCheckoutLine(this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                'Total price',
                style:
                TextStyle(color: AppColors.slateGrey),
              ),
              Text("EGP  $price"),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.magentaHaze,
                borderRadius: BorderRadius.circular(16.r)),
            width: 250.w,
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Check Out',
                    style: AppTextStyles.font16DelftBlue
                        .copyWith(color: Colors.white)),
                SizedBox(
                  width: 15.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
