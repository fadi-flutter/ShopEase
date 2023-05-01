import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/screens/login_screen.dart';
import 'package:shopease/widgets/auth_textfield.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:shopease/widgets/social_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: AppColors.bgColor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: AppTextStyle.boldBlack30.copyWith(fontSize: 36),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const AuthTextField(
                        text: 'Name',
                      ),
                      const AuthTextField(
                        text: 'Email',
                      ),
                      const AuthTextField(
                        text: 'Password',
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text.rich(
                            TextSpan(
                              style: AppTextStyle.mediumBlack14,
                              children: const [
                                TextSpan(text: 'Already have an acoount ?'),
                                TextSpan(
                                  text: '\u{2192}',
                                  style: TextStyle(
                                      fontSize: 30, color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      LongButton(
                        text: 'SIGN UP',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Or sign up with sociel account',
                        style: AppTextStyle.regularBlack12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SocialButton(
                          image: 'assets/images/google.png',
                        ),
                        SizedBox(width: 12),
                        SocialButton(
                          image: 'assets/images/facebook.png',
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
