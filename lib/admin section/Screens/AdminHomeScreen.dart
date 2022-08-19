import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/AdminHomeScreen_Controller.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  static final routeName = "/admin";
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body:
          Obx(() => controller.ScreenArray[controller.bottomNavBarIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.black,
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          selectedItemColor: Colors.brown,
          selectedIconTheme: const IconThemeData(
            color: Colors.brown,
          ),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
          currentIndex: controller.bottomNavBarIndex.value,
          onTap: controller.onBottomNavBarChange,
        ),
      ),
    );
  }
}
