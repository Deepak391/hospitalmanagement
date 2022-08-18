import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    print(user!.displayName);
    if (user == null) {
      //Get.offAll(() => LoginPage());
    } else {
      // Get.offAll(() => ProductsOverviewScreen());
    }
  }

  void signup(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Signup failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
