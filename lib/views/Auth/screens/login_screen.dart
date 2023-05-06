import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/controller/auth_controller.dart';
import 'package:shopease/views/Auth/screens/forget_password_screen.dart';
import 'package:shopease/views/Auth/screens/signup_screen.dart';
import 'package:shopease/widgets/auth_textfield.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:shopease/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController authC = Get.find<AuthController>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
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
          leading: BackButton(
            onPressed: () {
              Get.to(() => SignupScreen());
            },
            color: AppColors.black,
          ),
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
                  'Login',
                  style: AppTextStyle.boldBlack30.copyWith(fontSize: 36),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      AuthTextField(
                        controller: emailC,
                        text: 'Email',
                      ),
                      Obx(
                        () => AuthTextField(
                          controller: passwordC,
                          obscureText: authC.hidePassword.value,
                          text: 'Password',
                          trailing: authC.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          trailingTap: () {
                            authC.hidePassword.value
                                ? authC.hidePassword(false)
                                : authC.hidePassword(true);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgetPasswordScreen());
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text.rich(
                            TextSpan(
                              style: AppTextStyle.mediumBlack14,
                              children: const [
                                TextSpan(text: 'Forgot your password ?'),
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
                        text: 'LOGIN',
                        onPressed: () {
                          //email login method
                          authC.login(emailC.text, passwordC.text);
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Or Login with sociel account',
                        style: AppTextStyle.regularBlack12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          onTap: () {
                            authC.googlelogin();
                          },
                          image: 'assets/images/google.png',
                        ),
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
