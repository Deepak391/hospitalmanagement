import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';

class RestockMedicine extends GetView<RestockController> {
  static final routeName = "/restock";
  RestockMedicine({Key? key}) : super(key: key);

  var medicines = Get.find<StoreController>().medicines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restock Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () async {
            // controller.getRestockReq();
          },
          child: Obx(
            () => controller.restock.length > 0
                ? ListView(children: [
                    ...controller.restock.value.map((element) {
                      return Dismissible(
                        key: ValueKey(element.id),
                        onDismissed: (direction) {
                          controller.deleteRestockReq(element.id);
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [Text(element.med)],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ])
                : const Center(
                    child: Text(
                      "No Medicine Restock Request.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
