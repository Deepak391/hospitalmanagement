import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/models/medicine.dart';

class AddUpdateController extends GetxController with StateMixin {
  var sc = Get.find<StoreController>();

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController qunatityController;
  late TextEditingController imageUrlController;
  late TextEditingController categoryContreller;
  late TextEditingController typeController;

  var imageUrl = "".obs;
  var pageState = "add".obs;
  var buttonText = "".obs;

  var id = "".obs;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  checkUrl(val) {
    imageUrl.value = val;
    change(imageUrl, status: RxStatus.success());
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    qunatityController = TextEditingController();
    imageUrlController = TextEditingController();
    categoryContreller = TextEditingController();
    typeController = TextEditingController();

    if (Get.parameters["id"] != null) {
      id.value = Get.parameters["id"]!;
      var m = sc.medicines.firstWhere((element) => element.id == id.value);

      nameController.text = m.name;
      priceController.text = m.price.toString();
      descriptionController.text = m.description;
      qunatityController.text = m.quantity.toString();
      imageUrlController.text = m.image;
      categoryContreller.text = m.category;
      typeController.text = m.type;

      imageUrl.value = m.image;

      buttonText.value = "Update Medicine";
      pageState.value = "update";
    } else {
      buttonText.value = "Add Medicine";
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    qunatityController.dispose();
    imageUrlController.dispose();
    categoryContreller.dispose();
    typeController.dispose();
    super.onClose();
  }

  checkSignup() async {
    var isValid = key.currentState!.validate();
    // print(isValid);

    if (!isValid) {
      return;
    }

    if (pageState.value == "add") {
      var addedDocID;
      try {
        await FirebaseFirestore.instance.collection("medicines").add({
          "id": UniqueKey().toString(),
          "name": nameController.text,
          "description": descriptionController.text,
          "price": double.parse(priceController.text),
          "quantity": int.parse(qunatityController.text),
          "category": categoryContreller.text,
          "type": typeController.text,
          "image": imageUrlController.text,
          "directionToUse": ""
        }).then((value) {
          addedDocID = value.id;

          sc.medicines.add(
            Medicine(
              id: addedDocID,
              image: imageUrlController.text,
              category: categoryContreller.text,
              description: descriptionController.text,
              name: nameController.text,
              type: typeController.text,
              price: int.parse(priceController.text),
              quantity: int.parse(qunatityController.text),
            ),
          );
        });

        Get.snackbar("Medicine Added", "Medicine Added Successflully.");
        Get.back();
      } catch (e) {
        print(e);
        Get.snackbar("Something went wrong", "Error adding Medicine.");
      }
    } else {
      try {
        await FirebaseFirestore.instance
            .collection("medicines")
            .doc(id.value)
            .update({
          "id": UniqueKey().toString(),
          "name": nameController.text,
          "description": descriptionController.text,
          "price": double.parse(priceController.text),
          "quantity": int.parse(qunatityController.text),
          "category": categoryContreller.text,
          "type": typeController.text,
          "image": imageUrlController.text
        }).then((value) {
          Get.snackbar("Medicine Added", "Medicine Updated Successflully.");
          Get.back();
        });
      } catch (e) {
        Get.snackbar("Something went wrong", "Error adding Medicine.");
      }
    }
  }
}
