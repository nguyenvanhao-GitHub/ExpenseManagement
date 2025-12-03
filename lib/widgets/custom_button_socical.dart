import 'package:expense_management_app/constants/app_text_styles.dart';
import 'package:expense_management_app/widgets/app_image.dart';
import 'package:flutter/material.dart';

class CustomButtonSocical extends StatelessWidget {
  final String textButton;
  final String asset;
  final VoidCallback onPressed;

  const CustomButtonSocical({
    super.key,
    required this.textButton,
    required this.onPressed,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          textButton,
          style: AppTextStyles.labelLarge.copyWith(color: Color(0xFF242D35)),
        ),
        icon: AppImage(
          assets: asset,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          side: BorderSide(width: 1),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          minimumSize: const Size(double.infinity, 30),
        ),
      ),
    );
  }
}
