import 'package:ecommerce/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    splashController.checkLogin(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logos/—Pngtree—letter e logo  e_4833002.png"),
          ],
        ),
      ),
    );
  }
}
