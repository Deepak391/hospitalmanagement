import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/AdminHomeScreen_Controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminHomeController());
  }
}
