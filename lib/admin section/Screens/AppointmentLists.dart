import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/AppointmentController.dart';
import 'package:myapp/admin%20section/Screens/RestockMedicine.dart';

import '../Controllers/RestockController.dart';

class AppointmentList extends GetView<AppointmentController> {
  AppointmentList({Key? key}) : super(key: key);
  static const routeName = "/appointmentlist";

  var restockLen = Get.find<RestockController>().restock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment List"),
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
        padding: const EdgeInsets.all(10),
        child: controller.obx(
          (state) => RefreshIndicator(
            onRefresh: () async {
              controller.getAppointments();
            },
            child: ListView(
              children: [
                const Text(
                  "Appointment Lists : ",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...controller.appointments
                    .map(
                      (element) => Container(
                        margin: const EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: InkWell(
                            onLongPress: () {
                              controller.selectedTiming(element.reservedTime);
                              controller.selectedDay(element.reservedDate);

                              Get.bottomSheet(BottomSheet(
                                  onClosing: () {},
                                  builder: (ctx) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                ...controller.days
                                                    .map((e) => Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Obx(() =>
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor: controller
                                                                              .selectedDay
                                                                              .value ==
                                                                          e
                                                                      ? MaterialStateProperty.all<
                                                                              Color>(
                                                                          Colors
                                                                              .green)
                                                                      : MaterialStateProperty.all<
                                                                              Color>(
                                                                          Colors
                                                                              .blue),
                                                                ),
                                                                onPressed: () {
                                                                  controller
                                                                      .selectedDay(
                                                                          e);
                                                                },
                                                                child: Text(e),
                                                              )),
                                                        ))
                                                    .toList(),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                ...controller.Timings.map(
                                                  (e) => Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child:
                                                        Obx(
                                                            () =>
                                                                ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: controller.selectedTiming.value ==
                                                                            e
                                                                        ? MaterialStateProperty.all<Color>(Colors
                                                                            .green)
                                                                        : MaterialStateProperty.all<Color>(
                                                                            Colors.blue),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    controller
                                                                        .selectedTiming(
                                                                            e);
                                                                  },
                                                                  child:
                                                                      Text(e),
                                                                )),
                                                  ),
                                                ).toList(),
                                              ],
                                            ),
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                controller
                                                    .resheduleApp(element.id);
                                              },
                                              child: const Text("Reshedule"))
                                        ],
                                      ),
                                    );
                                  }));
                            },
                            onTap: () {},
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              child: Image.network(
                                                  element.docImage),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(element.docName),
                                          ],
                                        ),
                                        Text(
                                            "Patient Name : ${element.patientName}"),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.timer),
                                              Text(element.reservedTime)
                                            ],
                                          ),
                                          // Text(
                                          //   "Status : ${element.docStatus == true ? "Sheduled" : "Awaiting"}",
                                          // )
                                          Text("${element.reservedDate}")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
          ),
          onError: (error) => const Center(
            child: Text("Something went wrong."),
          ),
          onLoading: Center(
            child: Lottie.asset('assets/loader.json'),
          ),
        ),
      ),
    );
  }
}
