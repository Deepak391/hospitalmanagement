import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/models/restock.dart';

class RestockController extends GetxController with StateMixin {
  RxList<Restock> restock = <Restock>[].obs;

  // final CollectionReference restockMessage =
  //     FirebaseFirestore.instance.collection('restock');

  get RestockLength {
    return restock.length;
  }

  deleteRestockReq(String id) async {
    await FirebaseFirestore.instance
        .collection("restock")
        .doc(id)
        .delete()
        .then((value) {
      print("Successfully removed from the restock collection.");
      restock.removeWhere((element) => element.id == id);
    });
  }

  Stream<List<Restock>> getUserMessageStream() {
    List<Restock> messages = [];
    Stream<QuerySnapshot> snapshots =
        FirebaseFirestore.instance.collection('restock').snapshots();
    snapshots.listen((QuerySnapshot query) {
      if (query.docChanges.isNotEmpty) {
        messages.clear();
      }
    });
    return snapshots.map((snapshot) {
      // print(snapshot.docs);
      snapshot.docs.forEach((messageData) {
        messages.add(Restock.fromSnapshot(messageData));
      });
      //print('Total message fetched: ${messages.length}');
      return messages.toList();
    });
  }

  @override
  void onInit() {
    restock.bindStream(getUserMessageStream());
    // getUserMessageStream();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
