import 'package:ecommerce/controller/account_setup_controller.dart';
import 'package:ecommerce/controller/bottom_nav_controller.dart';
import 'package:ecommerce/controller/confirm_password_controller.dart';
import 'package:ecommerce/controller/forgot_password_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/login_controller.dart';
import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/controller/otp_controller.dart';
import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/controller/splash_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/view/splash/splash_screen.dart';
import 'package:ecommerce/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SplashController()),
        ChangeNotifierProvider(create: (ctx) => OnboardingController()),
        ChangeNotifierProvider(create: (ctx) => SignUpController()),
        ChangeNotifierProvider(create: (ctx) => LoginController()),
        ChangeNotifierProvider(create: (ctx) => ForgotPasswordController()),
        ChangeNotifierProvider(create: (ctx) => AccountSetupController()),
        ChangeNotifierProvider(create: (ctx) => OtpController()),
        ChangeNotifierProvider(create: (ctx) => BottomNavController()),
        ChangeNotifierProvider(create: (ctx) => HomeController()),
        ChangeNotifierProvider(create: (ctx) => ConfirmPasswordController()),
        ChangeNotifierProvider(create: (ctx) => ProductDetailController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTextStyle.headLine6,
            iconTheme: IconThemeData(
              color: AppColors.whiteColor,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.bgColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home: const BottomNavBar(),
      ),
    );
  }
}
