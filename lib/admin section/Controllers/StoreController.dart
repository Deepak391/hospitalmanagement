import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/models/medicine.dart';

class StoreController extends GetxController with StateMixin<dynamic> {
  var medicines = [].obs;

  getMedicines() async {
    var d = [];
    var data = await FirebaseFirestore.instance
        .collection("medicines")
        .get()
        .then((value) => d = value.docs);

    try {
      d.forEach(
        (e) => {
          medicines.add(
            Medicine(
              e.data()["id"],
              e.data()["image"],
              e.data()["category"],
              e.data()["description"],
              e.data()["name"],
              e.data()["type"],
              e.data()["price"],
              e.data()["quantity"],
            ),
          )
        },
      );
      print(medicines);
      change(medicines, status: RxStatus.success());
    } catch (e) {
      print(e);
      change("Something went wrong", status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    getMedicines();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
