import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userImage = ''.obs;
  final ImagePicker picker = ImagePicker();
  Rx<XFile> pickImage = XFile('').obs;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

  getProfile() async {
    final userID = auth.currentUser!.uid;
    DocumentSnapshot doc =
        await firestore.collection('users').doc(userID).get();
    userName.value = doc['name'];
    userEmail.value = doc['email'];
    userImage.value = doc['image'];
  }

  updateSettings(
    XFile pickedImage, {
    required String image,
    required String name,
  }) async {
    String url = '';
    EasyLoading.show();
    try {
      final user = auth.currentUser;
      if (pickImage.value.path != '') {
        url = await uploadImage(pickedImage);
      }
      await firestore.collection('users').doc(user!.uid).update({
        'image': url == '' ? image : url,
        'name': name.isEmpty ? userName.value : name,
      });
      Get.back();
      await getProfile();
      rawSackbar('Settings updated succesfully');
    } on Exception catch (e) {
      EasyLoading.dismiss();
      rawSackbar('Something went wrong, please try again ${e.toString()}');
    }
    EasyLoading.dismiss();
  }

  sendEmail() async {
    await auth.sendPasswordResetEmail(email: emailC.text);
    rawSackbar('Email sent successfuly');
  }

  getProfileImage() async {
    final img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      pickImage.value = XFile(img.path);
      return File(img.path);
    }
    return null;
  }

  uploadImage(XFile image) async {
    UploadTask? uploadTask;
    final storage = FirebaseStorage.instance.ref();
    final path = 'images/${image.path}';
    final file = File(image.path);
    final ref = storage.child(path);
    uploadTask = ref.putFile(file);
    final snapshot =
        await uploadTask.whenComplete(() => print('Image Uploaded'));
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}
