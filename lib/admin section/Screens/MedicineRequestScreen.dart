import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/MRDController.dart';

import '../Widgets/RequestCard.dart';

class MedicineRequestScreen extends GetView<MRDController> {
  static final routeName = "/medicinerequest";
  const MedicineRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Requests"),
      ),
      body: controller.obx(
        (state) => Obx(
          () => controller.isLoading.value == false
              ? Container(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getMedReq();
                    },
                    child: ListView(
                      children: [
                        if (controller.medReq
                            .where((p0) => p0["status"] == "requested")
                            .isNotEmpty)
                          ...controller.medReq
                              .where((p0) => p0["status"] == "requested")
                              .map(
                                (element) => RequestCard(
                                  id: element["id"],
                                  medicines: element["medicines"],
                                  status: element["status"],
                                  patientName: element["patient"]["fullName"],
                                  quantityArr: element["quantityArr"],
                                  total: element["Total Price"],
                                ),
                              )
                              .toList(),
                        if (controller.medReq
                            .where((p0) => p0["status"] == "requested")
                            .isEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 250),
                            child: const Center(
                              child: Text(
                                "No Medicine Request.",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Lottie.asset('assets/loader.json'),
                ),
        ),
        onError: (error) {
          return Container(
            child: const Center(
              child: Text("Something went wrong."),
            ),
          );
        },
        onLoading: Center(
          child: Lottie.asset('assets/loader.json'),
        ),
      ),
    );
  }
}
