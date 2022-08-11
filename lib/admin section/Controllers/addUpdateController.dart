import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddUpdateController extends GetxController {
  late TextEditingController name;
  late TextEditingController price;
  late TextEditingController description;
  late TextEditingController qunatity;
  late TextEditingController imageUrl;
  late TextEditingController category;
  late TextEditingController type;

  @override
  void onInit() {
    name = TextEditingController();
    price = TextEditingController();
    description = TextEditingController();
    qunatity = TextEditingController();
    imageUrl = TextEditingController();
    category = TextEditingController();
    type = TextEditingController();
    super.onInit();
  }
}
