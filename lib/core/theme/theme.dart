import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const primaryColor=Color(0xFF004182);
  static ThemeData mainTheme=ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
      fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    )
  );
}