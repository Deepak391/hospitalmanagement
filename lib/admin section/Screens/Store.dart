import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddOrUpdateMedicine.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';
import 'package:myapp/admin%20section/Widgets/medicineItem.dart';

class Store extends GetView<StoreController> {
  static final routeName = "/store";
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Medicine Store"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                controller.getMedicines();
              },
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Medicines in Store",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...controller.medicines
                      .map(
                        (e) => MediicineItem(
                          id: e.id,
                          image: e.image,
                          description: e.description,
                          name: e.name,
                          price: e.price,
                          quantity: e.quantity,
                          type: e.type,
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddOrUpdateMedicine.routeName);
        },
        child: const Icon(Icons.medical_services),
        tooltip: "Add Medicine",
      ),
    );
  }
}
  //   ),
  // );
  // Container(
  //   padding: const EdgeInsets.all(10),
  //   child: controller.obx(
  //     (state) => RefreshIndicator(
  //       onRefresh: () async {
  //         controller.getMedicines();
  //       },
  //       child: ListView(
  //         // crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           const Text(
  //             "Medicines in Store",
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           ...controller.medicines.map((e) {
  //             print(e);
  //             return MediicineItem(
  //               id: e.id,
  //               image: e.image,
  //               description: e.description,
  //               name: e.name,
  //               price: e.price,
  //               quantity: e.quantity,
  //               type: e.type,
  //             );
  //           }).toList()
  //         ],
  //       ),
  //     ),
  //     onError: (error) {
  //       return Container(
  //         padding: const EdgeInsets.all(15),
  //         child: const Text("Something went wrong"),
  //       );
  //     },
  //   ),
  //   //          child: Obx(
  // () => Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     const Text(
  //       "Medicines in Store",
  //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //     ),
  //     SizedBox(
  //       height: 10,
  //     ),
  //     ...controller.medicines
  //         .map(
  //           (e) => MediicineItem(
  //             image: e.image,
  //             description: e.description,
  //             name: e.name,
  //             price: e.price,
  //             quantity: e.quantity,
  //             type: e.type,
  //           ),
  //         )
  //         .toList()
  //   ],
  // ),
  //   ),
  // );
  // floatingActionButton:
  // FloatingActionButton(
  //   onPressed: () {
  //     Get.toNamed(AddOrUpdateMedicine.routeName);
  //   },
  //   child: const Icon(Icons.medical_services),
  //   tooltip: "Add Medicine",
  // );

