import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/addPatientController.dart';

class AddPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddPatientController());
  }
}
