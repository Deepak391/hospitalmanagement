import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/AppointmentController.dart';

class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppointmentController());
  }
}
