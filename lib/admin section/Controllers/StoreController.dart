import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/models/medicine.dart';

class StoreController extends GetxController with StateMixin<dynamic> {
  var medicines = [].obs;

  delete(String id) async {
    await FirebaseFirestore.instance
        .collection("medicines")
        .doc(id)
        .delete()
        .then((value) => medicines.removeWhere((element) => element.id == id));
  }

  getMedicines() async {
    var d = [];
    var data = await FirebaseFirestore.instance
        .collection("medicines")
        .get()
        .then((value) => d = value.docs);
    medicines.removeRange(0, medicines.length);

    try {
      d.forEach(
        (e) => {
          // print(e.id),
          medicines.add(
            Medicine(
              id: e.id,
              image: e.data()["image"],
              category: e.data()["category"],
              description: e.data()["description"],
              name: e.data()["name"],
              type: e.data()["type"],
              price: e.data()["price"].toInt(),
              quantity: e.data()["quantity"].toInt(),
            ),
          )
        },
      );
      // print(medicines);
      // change(medicines, status: RxStatus.success());
    } catch (e) {
      print(e);
      // change("Something went wrong", status: RxStatus.error());
    }
  }

  Future<void> ref() async {
    getMedicines();
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
