import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Dashboard/dashboard.dart';

class AuthController extends GetxController {
  RxBool hidePassword = true.obs;
  final String userID = auth.currentUser!.uid;

  //email signup method
  signup(String email, String password, String name) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      rawSackbar('All Fields Required');
      return;
    }
    if (password.length < 6) {
      rawSackbar('Password must be atleast 6 characters');
      return;
    }
    try {
      EasyLoading.show();
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await firestore.collection('users').add({
        'time_stamp': DateTime.now(),
        'name': name,
        'email': email,
        'id': userID
      });
      EasyLoading.dismiss();
      Get.offAll(() => const DashBoard());
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      rawSackbar(
        e.message.toString(),
      );
    }
  }

  //email login method
  Future login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      rawSackbar('All Fields Required');
      return;
    }
    try {
      EasyLoading.show();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const DashBoard());
      EasyLoading.dismiss();
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      rawSackbar(
        e.message.toString(),
      );
    }
  }
  //google login method
  googlelogin(){
    
  }

  //forgot password method
  Future forgotPassword(String email) async {
    if (email.isEmpty) {
      rawSackbar('Enter Email');
      return;
    }
    try {
      EasyLoading.show();
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      EasyLoading.dismiss();
      rawSackbar('Email sent successfully, check your email');
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      rawSackbar(
        e.message.toString(),
      );
    }
  }
}
