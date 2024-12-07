import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle font24White = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font20MagentaHaze = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.magentaHaze,
  );
  static TextStyle font18MagentaHaze = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.magentaHaze,
  );
  static TextStyle font16DelftBlue = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.delftBlue,
  );
  static TextStyle font14White = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font14DelfBlue = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.delftBlue,
  );
}
