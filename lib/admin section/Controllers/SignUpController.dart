import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  var imgSelected = false.obs;
  var filePath = "".obs;
  late File file;
  var loading = false.obs;

  var dropdownValue = "Admin".obs;

  Future<void> getImage() async {
    final imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 150,
      imageQuality: 50,
    );
    print(imagePicker!.path);
    filePath.value = imagePicker.path;
    print(filePath.value);
    imgSelected.value = !imgSelected.value;
    file = File(filePath.value);
    print(imgSelected);
    // return image;
  }

  final getStorage = GetStorage();

  late TextEditingController emailController,
      passwordController,
      addressController,
      phoneController,
      usernameController;
  var email = '';
  var password = '';
  var username = "";
  var address = "";
  var phoneNumber;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.length < 4) {
      return "Username must be of 4 characters";
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.length < 10) {
      return "Phone Number must be of 10 characters";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 6) {
      return "Please enter proper address.";
    }
    return null;
  }

  late File img;
  String? imagePath;

  var user;

  void checkSignup() async {
    final _auth = FirebaseAuth.instance;
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (file == null) {
      print("Please select a file.");
      return;
    }
    loading(true);
    signUpKey.currentState!.save();
    var authResult;

    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(authResult.user);
      user = authResult.user;
      // print(user);
      String uid = user.uid;

      // print("UserId : $uid");

      final ref =
          FirebaseStorage.instance.ref().child("user_img").child(uid + ".jpg");

      // print("File : $file");
      await ref
          .putFile(file)
          .whenComplete(() => print("Image uploaded successfully."));

      final imgurl = await ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({"role": dropdownValue.value});

      if (dropdownValue.value == "Admin") {
        print(uid);
        await FirebaseFirestore.instance.collection("admins").doc(uid).set(
          {
            "email": email,
            "username": username,
            "phoneNumber": phoneNumber,
            "image": imgurl
          },
        );
      } else if (dropdownValue.value == "Doctor") {
        await FirebaseFirestore.instance.collection("admins").doc(uid).set(
          {
            "email": email,
            "fullName": username,
            "phoneNumber": phoneNumber,
            "specialization": "",
            "qualification": "",
            "years of expirence": 0,
            "image": imgurl,
            "description": "",
            "appointment List": []
          },
        );
      } else {
        await FirebaseFirestore.instance.collection("patients").doc(uid).set(
          {
            "email": email,
            "username": username,
            "phoneNumber": phoneNumber,
            "image": imgurl,
            "age": 0,
            "sex": ""
          },
        );
      }

      Get.snackbar(
        "Success",
        "Signup Successful",
        snackPosition: SnackPosition.BOTTOM,
      );
      await Future.delayed(Duration(microseconds: 1000));
      Get.toNamed("/intro");
    } catch (e) {
      loading(false);
      print(e);
      // change();
      Get.snackbar(
        "Error",
        "User already exists.",
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
