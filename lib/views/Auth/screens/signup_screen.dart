import 'package:flutter/material.dart';
import 'package:shopping_app/utilities/app_colors.dart';
import 'package:shopping_app/utilities/app_textstyle.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: const BackButton(
          color: AppColors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: AppTextStyle.boldBlack30.copyWith(fontSize: 35),
              ),
              Column(
                children: const [
                  AuthTextField(
                    text: 'Name',
                  ),
                  AuthTextField(
                    text: 'Email',
                  ),
                  AuthTextField(
                    text: 'Password',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        cursorColor: AppColors.grey,
        style: AppTextStyle.mediumBlack14,
        decoration: InputDecoration(
          labelText: text,
          labelStyle:
              AppTextStyle.regularWhite16.copyWith(color: AppColors.grey),
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(08)),
            borderSide: BorderSide(color: AppColors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(08)),
            borderSide: BorderSide(color: AppColors.bgColor),
          ),
        ),
      ),
    );
  }
}
