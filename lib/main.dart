import 'package:ecommerce/config/scroll_config.dart';
import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/bottom_nav_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/confirm_password_controller.dart';
import 'package:ecommerce/controller/edit_profile_controller.dart';
import 'package:ecommerce/controller/forgot_password_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/login_controller.dart';
import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/controller/orders_controller.dart';
import 'package:ecommerce/controller/otp_controller.dart';
import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/controller/products_filter_controller.dart';
import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/controller/splash_controller.dart';
import 'package:ecommerce/controller/stepper_controller.dart';
import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/helpers/nav_key_helper.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (ctx) => EditProfileController()),
        ChangeNotifierProvider(create: (ctx) => OtpController()),
        ChangeNotifierProvider(create: (ctx) => BottomNavController()),
        ChangeNotifierProvider(create: (ctx) => HomeController(HomeServices())),
        ChangeNotifierProvider(create: (ctx) => CreateNewPasswordController()),
        ChangeNotifierProvider(create: (ctx) => ProductDetailController()),
        ChangeNotifierProvider(create: (ctx) => CartController()),
        ChangeNotifierProvider(create: (ctx) => WishlistController()),
        ChangeNotifierProvider(create: (ctx) => OrdersController()),
        ChangeNotifierProvider(create: (ctx) => AddressController()),
        ChangeNotifierProvider(create: (ctx) => ProfileController()),
        ChangeNotifierProvider(create: (ctx) => StepperController()),
        ChangeNotifierProvider(create: (ctx) => ProductFilterController()),
      ],
      child: MaterialApp(
        scrollBehavior: MyBehavior(),
        title: 'Flutter Demo',
        navigatorKey: NavKeyHelper.navigatorKey,
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
            primary: AppColors.mainColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      ),
    );
  }
}
