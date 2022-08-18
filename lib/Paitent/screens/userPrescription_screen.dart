import 'package:flutter/material.dart';
import '../Model/userAppt_model.dart';
import '../Model/userprescription_model.dart';
import '../controller/userPre_controller.dart';
import 'package:get/get.dart';

final PreController controller = Get.put(PreController());

class userPrescription extends StatelessWidget {
  Appointment pdoc;
  userPrescription({Key? key, required this.pdoc}) : super(key: key);

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
                pdoc.docImage,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 810,
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
                          pdoc.docName,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      pdoc.docSpecilization,
                      style: TextStyle(fontSize: 16.5, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 15),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Prescription",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text(
                      "Medicines",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 550,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        Prescription pre =
                            Prescription.Prescriptionlist.firstWhere(
                                (element) => element.id == 'P001');

                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ListTile(
                                leading: Image.asset(pre.image),
                                title: Text(
                                  pre.name,
                                  style: const TextStyle(
                                    color: Color(0xff1E1C61),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  pre.useage,
                                  style: TextStyle(
                                    color: Color(0xff1E1C61).withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Downlaod Prescription");
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffEF716B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Download Prescription",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.request("63IK1S1DZm3ggpA1Nj6c");
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffEF716B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Request Prescription",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
