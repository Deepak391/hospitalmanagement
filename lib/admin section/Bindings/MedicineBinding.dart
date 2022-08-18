import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/MedicineDetailsController.dart';
import 'package:myapp/admin%20section/Screens/Medicine%20Details.dart';

class MedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MedicineDetailController());
  }
}
