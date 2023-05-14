import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/screens/signup_screen.dart';
import 'package:shopease/views/Dashboard/profile/controllers/profile_controller.dart';
import 'package:shopease/views/Dashboard/profile/screens/setttings_screen.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
          child: Obx(
            () => Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: profileC.userImage.value == ''
                        ? Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            profileC.userImage.value,
                          ),
                  ),
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
                    'Change password & name...',
                    style: AppTextStyle.regularWhite12
                        .copyWith(color: AppColors.grey),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      profileC.nameC.text = profileC.userName.value;
                      profileC.emailC.text = profileC.userEmail.value;
                      Get.to(() => SettingScreen(
                            profileC: profileC,
                          ));
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const Spacer(),
                LongButton(
                  onPressed: () async {
                    auth.signOut();
                    GoogleSignIn().signOut();
                    rawSackbar('Logout successfuly');
                    Get.offAll(() => SignupScreen());
                  },
                  text: 'Logout',
                  width: 100,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
