import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/MRDController.dart';

class MrdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MRDController());
  }
}
