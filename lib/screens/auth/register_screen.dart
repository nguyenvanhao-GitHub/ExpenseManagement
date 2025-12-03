import 'package:expense_management_app/constants/app_colors.dart';
import 'package:expense_management_app/constants/app_text_styles.dart';
import 'package:expense_management_app/widgets/custom_button.dart';
import 'package:expense_management_app/widgets/custom_button_socical.dart';
import 'package:expense_management_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../widgets/app_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Các controller cho form đăng ký
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String error = '';

  // Hàm xử lý logic đăng ký giả lập
  void register(String name, String email, String password) {
    // Giả lập logic đăng ký thành công
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Register success')));
    // Sau khi đăng ký thành công có thể navigate về trang Login hoặc Home
    // Navigator.pop(context);
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // Kiểm tra thêm logic mật khẩu nhập lại
      if (_passwordController.text != _confirmPasswordController.text) {
        setState(() {
          error = 'Passwords do not match';
        });
        return;
      }

      // Reset lỗi nếu mọi thứ OK
      setState(() {
        error = '';
      });

      register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              const SizedBox(height: 10),
              // Logo có thể giữ nguyên hoặc dùng logo khác tùy thiết kế
              const AppImage(
                assets: AppConstants.splashBig,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),

              // Hiển thị lỗi chung
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  error.isEmpty
                      ? Container()
                      : const Icon(Icons.warning, color: Colors.red),
                  if (error.isNotEmpty) const SizedBox(width: 8),
                  Text(error, style: const TextStyle(color: Colors.red)),
                ],
              ),

              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    // Field nhập Tên
                    CustomField(
                      controller: _nameController,
                      hintText: 'Full Name',
                      prefixIcon: Icons.person_outline,
                      subfixIcon: null,
                      obscureText: false,
                      type: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    // Field nhập Email
                    CustomField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      subfixIcon: null,
                      obscureText: false,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),

                    // Field nhập Password
                    CustomField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      subfixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),

                    // Field nhập lại Password (Confirm Password)
                    CustomField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_reset,
                      subfixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              // Button Register
              CustomButton(textButton: 'REGISTER', onPressed: _handleRegister),

              Text('OR', style: AppTextStyles.bodyLarge),

              CustomButtonSocical(
                textButton: 'CONTINUE WITH GOOGLE',
                onPressed: () {},
                asset: AppConstants.iconGoogle,
              ),
              CustomButtonSocical(
                textButton: 'CONTINUE WITH APPLE',
                onPressed: () {},
                asset: AppConstants.iconApple,
              ),

              // Chuyển hướng về Login
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: AppTextStyles.bodyMedium,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        onPressed: () {
                          // Quay lại màn hình Login
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login here',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: const Color(0xFF0E33F3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Padding bottom
            ],
          ),
        ),
      ),
    );
  }
}
