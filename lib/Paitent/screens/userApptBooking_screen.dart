import 'package:flutter/material.dart';
import '/Paitent/Model/userdoctor_model.dart';
import '/Paitent/screens/userHome_screen.dart';
import '../controller/userAppt_controller.dart';

import 'package:get/get.dart';

final ApptController controller = Get.put(ApptController());

class ApptBooking extends StatelessWidget {
  const ApptBooking({Key? key, required this.doc}) : super(key: key);
  final Doctor doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdfe4ea),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                doc.image,
                height: 160,
                width: 160,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 800,
              width: 625,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          doc.name,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      doc.specialization,
                      style: TextStyle(fontSize: 16.5, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Center(
                      child: Text(
                        'Appointment Booking',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      controller.monthyear,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Obx(
                      () => Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(
                          controller.DaytimeArr.length,
                          (index) => GestureDetector(
                            onTap: () => controller.changeDay(index),
                            child: Container(
                              width: 80,
                              margin: EdgeInsets.only(left: 15, top: 20),
                              decoration: BoxDecoration(
                                color: (controller.indexDaytime.value == index)
                                    ? Color(0xffEF716B)
                                    : Colors.white,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      '${controller.daynamecal(index)}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.all(7),
                                    child: Text(
                                      '${controller.datacal(index)}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Timings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 70, top: 10),
                      width: 450,
                      child: Obx(
                        () => GridView.builder(
                          padding: EdgeInsets.all(5),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 6,
                                  crossAxisSpacing: 6,
                                  crossAxisCount: 3,
                                  childAspectRatio: 2),
                          itemCount: controller
                              .DaytimeArr[controller.indexDaytime.value].length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              controller.selectdate(index);
                              controller.currentIndex.value = index;
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              decoration: BoxDecoration(
                                color: controller.DaytimeArr[controller
                                            .indexDaytime
                                            .value][index]["status"] ==
                                        "available"
                                    ? Colors.white
                                    : controller.DaytimeArr[controller
                                                .indexDaytime
                                                .value][index]["status"] ==
                                            "filled"
                                        ? Colors.amber
                                        : Color(0xffEF716B),
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 2),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Text(
                                      controller.timeslots[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Its Emergency ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(
                          () => Switch.adaptive(
                            value: controller.emergencyIsSelected.value,
                            onChanged: ((value) {
                              controller.emergencyIsSelected.value = value;
                            }),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Shedule Regular Checkups ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(
                          () => Switch.adaptive(
                            value: controller.regularIsSelected.value,
                            onChanged: ((value) {
                              controller.regularIsSelected.value = value;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.confirmBooking(
                        doc.name,
                        doc.docId,
                        doc.image,
                        doc.specialization,
                      );
                      Get.to(() => UserHomeScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffEF716B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Confirm Booking",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
