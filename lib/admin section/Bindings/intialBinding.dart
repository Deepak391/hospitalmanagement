import 'package:get/instance_manager.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController(), permanent: true);
  }
}
