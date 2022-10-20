import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/confirm_password/confirm_password_screen.dart';
import 'package:ecommerce/view/favorites/wishlist_screen.dart';
import 'package:ecommerce/view/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/onboarding/onboarding_screen.dart';
import 'package:ecommerce/view/otp/otp_screen.dart';
import 'package:ecommerce/view/product_detail/product_detail_arguments.dart';
import 'package:ecommerce/view/product_detail/product_detail_screen.dart';
import 'package:ecommerce/view/sign_up/sign_up_screen.dart';
import 'package:ecommerce/view/splash/splash_screen.dart';
import 'package:ecommerce/widgets/bottom_nav_widget.dart';
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
      case RouteNames.confirmPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmPasswordScreen(),
        );
      case RouteNames.otpScreen:
        return MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        );
      // case RouteNames.accountSetupScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const AccountSetupScreen(),
      //   );
      case RouteNames.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case RouteNames.productDetail:
        ProductDetailArguments args =
            settings.arguments as ProductDetailArguments;
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            index: args.index,
            product: args.product,
          ),
        );
      case RouteNames.wishlistScreen:
        return MaterialPageRoute(
          builder: (context) => const WishlistScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
