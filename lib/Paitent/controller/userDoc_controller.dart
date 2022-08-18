import 'package:get/get.dart';
import '/Paitent/Model/user_model.dart';
import '../Model/userdoctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  RxInt currentBottomNavItemIndex = 0.obs;
  RxList<Doctor> allDoctors = <Doctor>[].obs;
  RxList<Doctor> filteredDoctors = <Doctor>[].obs;
  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getdoc();
    
  }

  void getdoc() async {
    isLoading.value = true;
    var d = await FirebaseFirestore.instance
        .collection("userDoctor")
        .get()
        .then((value) => value.docs);
    d.forEach((ele) {
      allDoctors.add(Doctor(
          ele.data()['name'],
          ele.data()['image'],
          ele.data()['description'],
          ele.data()['specialization'],
          ele.data()['type'],
          ele.data()['docId']));
    });
    filteredDoctors.assignAll(allDoctors);
    isLoading.value = false;
  }

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  filterItemByCategory(DoctorSpecilization category) {
    for (var element in DoctorSpecilization.categories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == Docspecialization.All) {
      filteredDoctors.assignAll(allDoctors);
    } else {
      filteredDoctors.assignAll(allDoctors.where((item) {
        return item.type == category.type.name.toString();
      }).toList());
    }

    update();

    filteredDoctors.refresh();
  }
}
