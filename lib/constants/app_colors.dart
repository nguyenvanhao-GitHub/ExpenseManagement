import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color cyanNeon = Color(0xFF2FDAFF);
  static const Color electricBlue = Color(0xFF0E33F3);

  static const Color background = white;

  static const Color primaryBrand = electricBlue;

  static const LinearGradient brandGradient = LinearGradient(
    colors: [electricBlue, cyanNeon],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const Color highLightButton = Color(0xFFEBEEF0);
}
