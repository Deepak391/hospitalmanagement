import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with StateMixin {
  var loading = false.obs;
  var email = '';
  var password = '';

  var dropdownValue = "Admin".obs;

  GlobalKey<FormState> loginFormKey = GlobalKey();
  GetStorage getStorage = GetStorage();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
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

  var user;

  void checkLogin() async {
    final _auth = FirebaseAuth.instance;
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();

    try {
      loading(true);
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user;
      print(authResult.user!.uid);

      var d = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      print(d.data());

      getStorage.write("userID", user.uid);

      if (d.data()!["role"] == "Admin") {
        print("Admin");
      } else if (d.data()!["role"] == "Doctor") {
        print("Doctor");
      } else {
        print("Patient");
      }

      await Future.delayed(
        Duration(seconds: 2),
        () => Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
        ),
      );
      loading(false);
    } catch (e) {
      loading(false);
      print(e);
      Get.snackbar(
        "Error",
        "Someting went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
