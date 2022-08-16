import 'dart:io';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddPatientController extends GetxController with StateMixin {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  late TextEditingController emailController;

  late var imageUrl = "".obs;
  late File img;
  var imgS = false.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onReady() {
    change("", status: RxStatus.success());
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.onClose();
  }

  submit() async {
    isLoading.value = true;
    var valid = gkey.currentState!.validate();

    if (!valid) {
      // await Future.delayed(Duration(milliseconds: 2000));
      isLoading.value = false;
      return;
    }

    var tempPassword = UniqueKey().toString();

    final auth = FirebaseAuth.instance;

    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: tempPassword,
      );

      var user = authResult.user;

      var imgUrl = "";

      if (imgS.value) {
        var ref = await FirebaseStorage.instance
            .ref()
            .child("patients_img")
            .child(user!.uid + ".jpg");

        await ref
            .putFile(img)
            .whenComplete(() => print("Image Uploaded Successfully."));

        imgUrl = await ref.getDownloadURL();
      }

      await FirebaseFirestore.instance
          .collection("patients")
          .doc(user!.uid)
          .set(
        {
          "patientId": user.uid,
          "email": emailController.text,
          "fullName": nameController.text,
          "image": imgUrl,
          "age": ageController.text,
          "sex": genderController.text
        },
      ).then((value) {
        Get.snackbar(
          "Success",
          "Successfully added the user",
          snackPosition: SnackPosition.TOP,
        );

        emailController.text = "";
        nameController.text = "";
        ageController.text = "";
        genderController.text = "";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getImage() async {
    final imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 150,
      imageQuality: 50,
    );
    // imageUrl.value = imagePicker!.path;
    img = File(imagePicker!.path);
    print(img);
    imgS.value = true;
    update();
  }
}
