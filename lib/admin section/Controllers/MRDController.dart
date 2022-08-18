import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/models/medicine.dart';

class MRDController extends GetxController with StateMixin<dynamic> {
  var medReq = [].obs;

  var medicines = Get.find<StoreController>().medicines;

  var isLoading = false.obs;

  getMedReq() async {
    medReq([]);

    List<QueryDocumentSnapshot> d = await FirebaseFirestore.instance
        .collection("MedicineRequest")
        .get()
        .then((value) => value.docs);

    for (int i = 0; i < d.length; i++) {
      // medReq.add(d[i].data());
      var p = d[i].data() as Map;

      var id = d[i].id;

      var med = [];
      var q = [];

      var tP = 0;

      for (int j = 0; j < p["medicines"].length; j++) {
        // print(p["medicines"][j]);
        var m = medicines
            .firstWhere((element) => element.id == p["medicines"][j]["mId"]);
        q.add(p["medicines"][j]["quantity"]);
        int p1 = p["medicines"][j]["quantity"];
        int p2 = m.price;
        print(m.name);
        print("$p1 * $p2 = ${p1 * p2}");
        tP = tP + (p1 * p2);
        med.add(m);
      }
      print(q);
      var patient = await FirebaseFirestore.instance
          .collection("patients")
          .doc(p["patientID"])
          .get();

      // print(med);
      // print(patient.data());

      // var med = [];
      // for (int j = 0; j < d[i].data()!["medicines"].lenght;) {}

      medReq.add({
        "id": id,
        "medicines": med,
        "status": p["status"],
        "patient": patient.data(),
        "quantityArr": q,
        "Total Price": tP
      });
    }

    print(medReq);
    change(medReq, status: RxStatus.success());
  }

  acceptMedReq(List<dynamic> med, String medReqId, List<dynamic> q) async {
    for (int i = 0; i < med.length; i++) {
      var m = medicines.firstWhere((element) => element.id == med[i].id);
      var restock = false;
      await FirebaseFirestore.instance
          .collection("medicines")
          .doc(med[i].id)
          .update({"quantity": m.quantity - q[i]}).then(
        (value) {
          m.quantity = m.quantity - q[i];
          if (m.quantity <= 10) {
            restock = true;
          }
        },
      );

      if (restock) {
        await FirebaseFirestore.instance
            .collection("restock")
            .add({"med": m.name});
      }
    }

    await FirebaseFirestore.instance
        .collection("MedicineRequest")
        .doc(medReqId)
        .update({"status": "done"}).then((value) {
      print("Med Req successfully accepted.");

      medReq.removeWhere((element) => element["id"] == medReqId);
    });
  }

  getMedInfo(String id) async {
    await FirebaseFirestore.instance
        .collection("medicines")
        .doc(id)
        .get()
        .then((value) => print(value));
  }

  @override
  void onInit() {
    getMedReq();
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
