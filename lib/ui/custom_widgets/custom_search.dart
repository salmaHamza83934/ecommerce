import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:ecommerce_app/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomTextField(),
        SizedBox(
          width: 15.w,
        ),
        Image.asset(
          MyAssets.shoppingCart,
          height: 35.h,
          width: 35.w,
        ),
      ],
    );
  }
}
