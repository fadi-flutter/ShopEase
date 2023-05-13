import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/profile/controllers/profile_controller.dart';
import 'package:shopease/widgets/auth_textfield.dart';
import 'dart:io';
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
                GestureDetector(
                  onTap: () {
                    profileC.getProfileImage();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Obx(
                      () => ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: profileC.userImage.value != ''
                            ? Image.network(
                                profileC.userImage.value,
                                height: 90,
                                fit: BoxFit.cover,
                              )
                            : profileC.pickImage.value.path == ''
                                ? Image.asset(
                                    'assets/images/profile.png',
                                    height: 90,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(profileC.pickImage.value.path),
                                    height: 90,
                                  ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Tap to change photo',
                  style: AppTextStyle.regularBlack14,
                ),
                const SizedBox(height: 15),
                AuthTextField(
                  text: 'Change name',
                  controller: profileC.nameC,
                ),
                const SizedBox(height: 05),
                AuthTextField(
                  readOnly: true,
                  controller: profileC.emailC,
                  text: 'Email',
                ),
                const SizedBox(height: 10),
                Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: AppTextStyle.regularBlack12,
                ),
                const SizedBox(height: 20),
                LongButton(
                  onPressed: () {
                    profileC.sendEmail();
                  },
                  text: 'Send email',
                  width: 100,
                  height: 40,
                ),
                const Spacer(),
                LongButton(
                    onPressed: () async {
                      await profileC.updateSettings(
                        image: '',
                        name: profileC.nameC.text,
                        profileC.pickImage.value,
                      );
                    },
                    text: 'SAVE SETTINGS'),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
