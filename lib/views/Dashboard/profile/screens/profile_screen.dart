import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/profile/controllers/profile_controller.dart';
import 'package:shopease/views/Dashboard/profile/screens/setttings_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileC = Get.put(ProfileController());
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
                backgroundColor: AppColors.white,
                backgroundImage: AssetImage(
                  'assets/images/profile.png',
                ),
                radius: 45,
              ),
              Text(
                profileC.userName.value.capitalize!,
                style: AppTextStyle.mediumBlack24,
              ),
              Text(
                profileC.userEmail.value,
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
                    Get.to(() => SettingScreen(
                          profileC: profileC,
                        ));
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
