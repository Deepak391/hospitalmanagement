import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class RestockController extends GetxController with StateMixin {
  var restock = [].obs;

  @override
  void onInit() {
    getRestockReq();
    super.onInit();
  }

  getRestockReq() async {
    restock([]);
    List<QueryDocumentSnapshot> d = await FirebaseFirestore.instance
        .collection("restock")
        .get()
        .then((value) => value.docs);

    var m = [];

    for (int i = 0; i < d.length; i++) {
      var m1 = d[i].data() as Map;
      m.add(m1["med"]);
    }

    Set<dynamic> s = new Set.from(m);

    for (int i = 0; i < s.length; i++) {
      await FirebaseFirestore.instance
          .collection("medicines")
          .doc(s.elementAt(i))
          .get()
          .then((value) => restock.add(value.data()));
    }

    // print(restock);
    change(restock, status: RxStatus.success());
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
