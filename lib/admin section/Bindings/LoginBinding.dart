import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
