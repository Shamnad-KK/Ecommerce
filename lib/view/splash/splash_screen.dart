import 'package:ecommerce/controller/splash_controller.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    splashController.checkLogin(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logos/clothify_logo.png",
                height: size.height * 0.14,
                width: size.width * 0.14,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Clothify',
                    textStyle: AppTextStyle.headline4.copyWith(
                        fontFamily: GoogleFonts.dancingScript().fontFamily),
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
