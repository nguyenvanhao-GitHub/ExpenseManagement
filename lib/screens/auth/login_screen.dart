import 'package:expense_management_app/constants/app_colors.dart';
import 'package:expense_management_app/constants/app_text_styles.dart';
import 'package:expense_management_app/widgets/custom_button.dart';
import 'package:expense_management_app/widgets/custom_button_socical.dart';
import 'package:expense_management_app/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_routers.dart';
import '../../widgets/app_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
    } else {
      if (email.contains('admin') && password.contains('123')) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login success')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed')));
      }
    }
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      login(_emailController.text, _passwordController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String error = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              const SizedBox(height: 10),
              const AppImage(
                assets: AppConstants.splashBig,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  error.isEmpty
                      ? Container()
                      : Icon(Icons.warning, color: Colors.red),
                  Text(error, style: TextStyle(color: Colors.red)),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    CustomField(
                      controller: _emailController,
                      hintText: 'Username',
                      prefixIcon: Icons.person,
                      subfixIcon: null,
                      obscureText: false,
                      type: TextInputType.emailAddress,
                      validator: (p0) {
                        error = 'Please enter email';
                        return error;
                      },
                    ),
                    CustomField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      subfixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                      type: TextInputType.emailAddress,
                      validator: (p0) {
                        error = 'Please enter password';
                        return error;
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(textButton: 'LOGIN', onPressed: _handleLogin),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'FORGET PASSWORD',
                    style: AppTextStyles.labelMedium,
                  ),
                ),
              ),
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
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account?',
                  style: AppTextStyles.bodyMedium,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(AppRouters.register);
                        },
                        child: Text(
                          'Register here',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Color(0xFF0E33F3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
