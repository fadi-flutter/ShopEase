import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/auth_textfield.dart';
import 'package:shopease/widgets/long_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              Get.back();
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
                  'Forgot Password',
                  style: AppTextStyle.boldBlack30.copyWith(fontSize: 32),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Please, enter your email address. You will receive a link to create a new password via email.',
                        style: AppTextStyle.regularBlack12,
                      ),
                      const SizedBox(height: 10),
                      const AuthTextField(
                        text: 'Email',
                      ),
                      const SizedBox(height: 10),
                      LongButton(
                        text: 'SEND',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
