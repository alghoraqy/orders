import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders/core/constants/assets/app_images.dart';
import 'package:orders/module/orders/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: double.infinity,
        animationDuration: const Duration(milliseconds: 1000),
        splashTransition: SplashTransition.slideTransition,
        curve: Curves.easeInOut,
        backgroundColor: Colors.black,
        splash: Center(child: Image.asset(AppImages.orders, height: 200.h)),
        nextScreen: const HomeScreen(),
      ),
    );
  }
}
