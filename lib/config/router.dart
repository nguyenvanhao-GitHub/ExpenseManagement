import 'package:expense_management_app/constants/app_routers.dart';
import 'package:expense_management_app/screens/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/register_screen.dart';
import '../screens/intro/onboarding_screen.dart';
import '../screens/intro/splash_screen.dart';

final router = GoRouter(
  initialLocation: AppRouters.splash,
  routes: [
    GoRoute(
      path: AppRouters.splash,
      name: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRouters.onBoarding,
      name: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouters.login,
      name: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRouters.register,
      name: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
