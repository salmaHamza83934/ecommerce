import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 50.h,
      child: TextField(
        cursorColor: AppTheme.primaryColor,
        decoration: InputDecoration(
          hintText: 'What do you search for?',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(6, 0, 79, 0.6),
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppTheme.primaryColor.withOpacity(0.75),
            ),
            onPressed: () {},
          ),
          border: buildBaseBorder(),
          enabledBorder: buildBaseBorder(),
          focusedBorder: buildBaseBorder()!.copyWith(
            borderSide: BorderSide(width: 2),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1),
    );
  }
}
