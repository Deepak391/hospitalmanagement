import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.medication_outlined),
            title: const Text(
              "Customer Medicine Request",
              style: TextStyle(
                fontFamily: "Nunito",
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.medical_information_outlined),
            title: const Text(
              "Restock Medicine Request",
              style: TextStyle(
                fontFamily: "Nunito",
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.library_books_outlined),
            title: const Text(
              "Appointment List",
              style: TextStyle(
                fontFamily: "Nunito",
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text(
              "Medicine Store",
              style: TextStyle(fontFamily: "Nunito"),
            ),
            onTap: () {
              Get.toNamed("/store");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text(
              "Logout",
              style:
                  TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
