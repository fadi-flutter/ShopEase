import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utilities/app_colors.dart';
import 'package:shopping_app/utilities/app_textstyle.dart';
import 'package:shopping_app/views/Auth/screens/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const SignupScreen());
    });
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To,',
                style: AppTextStyle.mediumWhite14,
              ),
              Text('ShopEase',
                  style: AppTextStyle.boldWhite30.copyWith(fontSize: 40))
            ],
          ),
        ),
      ),
    );
  }
}