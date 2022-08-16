import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';

class RestockMedicine extends GetView<RestockController> {
  static final routeName = "/restock";
  const RestockMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restock Screen"),
      ),
      body: controller.obx(
        (state) => Container(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getRestockReq();
            },
            child: ListView(children: [
              ...controller.restock.value
                  .map((e) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e["name"]),
                                  Text("Quantity : ${e["quantity"]}")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ]),
          ),
        ),
        onLoading: Center(
          child: Lottie.asset('assets/loader.json'),
        ),
        onError: (error) => const Center(
          child: Text("Something went wrong."),
        ),
      ),
    );
  }
}
