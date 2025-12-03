import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? subfixIcon;
  final bool? obscureText;
  final TextInputType? type;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    this.type,
    required this.prefixIcon,
    required this.subfixIcon,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: type ?? TextInputType.text,
        obscureText: obscureText ?? false,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(subfixIcon) ?? Icon(null),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF37ABFF)),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
