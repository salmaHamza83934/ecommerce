import 'package:flutter/material.dart';

class AppTheme{
  static const primaryColor=Color(0xFF004182);
  static ThemeData mainTheme=ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
      fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    )
  );
}