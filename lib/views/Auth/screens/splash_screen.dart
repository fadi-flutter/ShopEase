import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/screens/signup_screen.dart';
import 'package:shopease/views/Dashboard/dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      final user = auth.currentUser;
      Get.offAll(() => user == null ? SignupScreen() : const DashBoard());
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
