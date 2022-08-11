import 'package:get/get.dart';
import 'package:myapp/admin%20section/Screens/AddPatient.dart';
import 'package:myapp/admin%20section/Screens/AdminProfile.dart';
import 'package:myapp/admin%20section/Screens/Home.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequest.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';

class AdminHomeController extends GetxController {
  var bottomNavBarIndex = 0.obs;

  onBottomNavBarChange(val) {
    bottomNavBarIndex.value = val;
    print(bottomNavBarIndex.value);
  }

  var ScreenArray = [
    Home(),
    AdminProfile(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
