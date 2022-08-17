import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/SignUpController.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
