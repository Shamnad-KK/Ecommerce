import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
    }
  }
}
