import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/admin%20section/Screens/AddPatient.dart';
import 'package:myapp/admin%20section/Screens/AdminProfile.dart';
import 'package:myapp/admin%20section/Screens/Home.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequest.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';

class AdminHomeController extends GetxController {
  var bottomNavBarIndex = 0.obs;

  GetStorage getS = new GetStorage();

  var user = {}.obs;

  onBottomNavBarChange(val) {
    bottomNavBarIndex.value = val;
    print(bottomNavBarIndex.value);
  }

  getUserInfo() async {
    await FirebaseFirestore.instance
        .collection('admins')
        .doc(getS.read("userID"))
        .get()
        .then((value) {
      print(value.data());
      user(value.data());
    });

    print(user);
  }

  var ScreenArray = [
    Home(),
    AdminProfile(),
  ].obs;

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
}
