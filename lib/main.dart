import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/controller/splash_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/splash/splash_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTextStyle.appbarTextStyle,
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
        home: const LoginScreen(),
      ),
    );
  }
}
