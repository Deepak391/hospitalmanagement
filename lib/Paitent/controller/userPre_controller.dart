import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreController extends GetxController {

  void request(String id) async{
    await FirebaseFirestore.instance
        .collection("prescription")
        .doc(id)
        .update({
      "status": "requested",
    });
  }

  

}