import 'dart:ffi';
import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/Paitent/Model/userprescription_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PreController extends GetxController {
  RxList<Prescription> allpre = <Prescription>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getpre();
  }

  void request(String id) async {
    await FirebaseFirestore.instance.collection("prescription").doc(id).update({
      "status": "requested",
    });
  }

  void getpre() async {
    var d = await FirebaseFirestore.instance
        .collection("userPrescription")
        .get()
        .then((value) => value.docs);
    d.forEach((ele) {
      allpre.add(Prescription(ele.data()['id'], ele.data()['name'],
          ele.data()['image'], ele.data()['useage']));
    });
  }

}
