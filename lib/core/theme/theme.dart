import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  static const primaryColor=Color(0xFF004182);
  static ThemeData mainTheme=ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
      fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    )
  );
}