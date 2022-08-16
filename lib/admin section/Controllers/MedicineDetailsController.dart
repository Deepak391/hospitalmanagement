import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/models/medicine.dart';

class MedicineDetailController extends GetxController with StateMixin<dynamic> {
  var medicines;
  var m;
  RxInt medicineQuantity = 0.obs;

  @override
  void onInit() {
    medicines = Get.find<StoreController>().medicines;

    try {
      m = medicines.firstWhere((element) => element.id == Get.parameters["id"]);
      medicineQuantity.value = m.quantity;
      change(m, status: RxStatus.success());
    } catch (e) {
      change("Something went wrong", status: RxStatus.error());
    }

    super.onInit();
  }

  incraseQuantity() {
    medicineQuantity.value += 10;
  }

  increaseMedicineQunatity() async {
    print(m.id);
    await FirebaseFirestore.instance
        .collection("medicines")
        .doc(m.id)
        .update({"quantity": medicineQuantity.value}).then(
      (value) {
        print("Success increasing Medicine Quantity.");
        Get.back();
      },
    ).catchError((err) {
      print(err);
      print("Something went wrong.");
      Get.back();
      Get.snackbar(
        "Something went wrong.",
        "Error while increasing the qunatity of the medicine.",
        snackPosition: SnackPosition.TOP,
      );
      medicineQuantity.value = m.quantity;
    });
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
