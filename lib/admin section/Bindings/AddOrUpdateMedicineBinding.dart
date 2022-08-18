import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/addUpdateController.dart';

class AddOrUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddUpdateController());
  }
}
