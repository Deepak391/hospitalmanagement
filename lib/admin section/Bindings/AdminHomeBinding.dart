import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/AdminHomeScreen_Controller.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestockController(), permanent: true);
    Get.put(AdminHomeController());
    Get.put(StoreController(), permanent: true);
  }
}
