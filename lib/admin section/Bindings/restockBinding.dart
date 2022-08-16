import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';

class RestockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestockController());
  }
}
