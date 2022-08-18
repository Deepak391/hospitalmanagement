import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/userAppt_controller.dart';
import 'userMediciensShop.dart';
import 'userApptlist_screen.dart';
import '../screens/userprofile_screen.dart';
import '../controller/userDoc_controller.dart';
import '../screens/userMain_screen.dart';

final UserController controller = Get.put(UserController());

class UserHomeScreen extends StatelessWidget {
  static const routeName = "/patientHome";

  UserHomeScreen({Key? key}) : super(key: key);

  final List<Widget> screen = [
    const UserMainScreen(),
    const UserAppList(),
    const Medshop(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => screen[controller.currentBottomNavItemIndex.value],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            selectedItemColor: Colors.black54,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            onTap: controller.switchBetweenBottomNavigationItems,
            selectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedFontSize: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books), label: 'Appts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.medication), label: 'Medicines'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile')
            ]);
      }),
    );
  }
}
