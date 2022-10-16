import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/onboarding/onboarding_screen.dart';
import 'package:ecommerce/view/sign_up/sign_up_screen.dart';
import 'package:ecommerce/view/splash/splash_screen.dart';
import 'package:ecommerce/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
