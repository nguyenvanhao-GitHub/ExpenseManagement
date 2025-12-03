import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Inter';

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 36,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: Color(0xFF6B7580),
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFF6B7580),
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}
