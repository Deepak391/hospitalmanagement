import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Screens/RestockMedicine.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

import '../Controllers/RestockController.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var restockLen = Get.find<RestockController>().restock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Admin Home"),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(RestockMedicine.routeName);
                  },
                  icon: const Icon(Icons.medical_services_rounded)),
              Obx(
                () => Positioned(
                  right: 10,
                  child: Container(
                    width: 20, height: 20,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        "${restockLen.length}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: FittedBox(child: Icon(Icons.admin_panel_settings)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Rules/Responsibilities : ",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Add, Delete or Update any medicines."),
                      Icon(Icons.check_box),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Restock the Medicine."),
                      Icon(Icons.check_box),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Add patients on the patient request."),
                      Icon(Icons.check_box),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Handle the Prescription requests."),
                      Icon(Icons.check_box),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Manage the Appointments."),
                      Icon(Icons.check_box),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
