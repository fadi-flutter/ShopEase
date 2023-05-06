import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

showFirebaseAuthException(BuildContext context, FirebaseAuthException e) {
  String errorMessage;
  switch (e.code) {
    case 'invalid-email':
      errorMessage = 'The email address is badly formatted.';
      break;
    case 'weak-password':
      errorMessage = 'The password provided is too weak.';
      break;
    case 'email-already-in-use':
      errorMessage = 'The email address is already in use by another account.';
      break;
    default:
      errorMessage =
          'An error occurred while creating the account. Please try again later.';
      break;
  }
  return errorMessage;
}

rawSackbar(String title) {
  Get.rawSnackbar(
    backgroundColor: AppColors.black,
    duration: const Duration(seconds: 4),
    messageText: Center(
      child: Text(
        title,
        style: AppTextStyle.regularWhite16,
      ),
    ),
  );
}
