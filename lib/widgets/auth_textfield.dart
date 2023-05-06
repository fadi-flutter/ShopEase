import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.text,
    this.trailing,
    this.controller,
    this.obscureText = false,
    this.trailingTap,
  });
  final String text;
  final IconData? trailing;
  final VoidCallback? trailingTap;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: obscureText!,
        controller: controller,
        cursorColor: AppColors.grey,
        style: AppTextStyle.mediumBlack14,
        decoration: InputDecoration(
          suffixIcon:
              GestureDetector(onTap: trailingTap, child: Icon(trailing)),
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
