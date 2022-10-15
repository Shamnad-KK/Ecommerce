import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          titleTextStyle: AppTextStyle.appbarTextStyle,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.bgColor,
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      home: const OnboardingScreen(),
    );
  }
}
