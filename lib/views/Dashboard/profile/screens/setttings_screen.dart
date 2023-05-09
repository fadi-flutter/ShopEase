import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/profile/controllers/profile_controller.dart';
import 'package:shopease/widgets/auth_textfield.dart';
import 'package:shopease/widgets/long_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, required this.profileC});
  final ProfileController profileC;
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
          leading: const BackButton(color: AppColors.black),
          backgroundColor: AppColors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Settings',
            style: AppTextStyle.mediumBlack20,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 50,
                    child: IconButton(
                      onPressed: () {
                        profileC.getProfileImage();
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: AppColors.white,
                        size: 30,
                      ),
                    )),
                const SizedBox(height: 7),
                Text(
                  'Change photo',
                  style: AppTextStyle.regularBlack14,
                ),
                const SizedBox(height: 15),
                const AuthTextField(
                  text: 'Change name',
                ),
                const SizedBox(height: 05),
                const AuthTextField(
                  text: 'Change password',
                ),
                const Spacer(),
                LongButton(onPressed: () {}, text: 'SAVE SETTINGS'),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
