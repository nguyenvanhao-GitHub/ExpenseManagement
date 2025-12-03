import 'dart:async';

import 'package:expense_management_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(child: SizedBox(child: Image.asset(AppConstants.splashBig))),
    );
  }

  startTimer() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, redirect);
  }

  redirect() {
    context.goNamed(AppRouters.onBoarding);
  }
}
