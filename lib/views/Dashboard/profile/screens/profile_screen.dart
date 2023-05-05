import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/profile/screens/setttings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'My profile',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          alignment: Alignment.center,
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.black,
                radius: 45,
              ),
              Text(
                'Fahad Ali',
                style: AppTextStyle.mediumBlack24,
              ),
              Text(
                'fahadalicspb3010@gmail.com',
                style: AppTextStyle.regularBlack14.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: AppColors.white,
                title: Text(
                  'Settings',
                  style: AppTextStyle.mediumBlack16,
                ),
                subtitle: Text(
                  'Change paswword & name...',
                  style: AppTextStyle.regularWhite12
                      .copyWith(color: AppColors.grey),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Get.to(() => const SettingScreen());
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
