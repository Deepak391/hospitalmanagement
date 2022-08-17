import 'package:flutter/material.dart';
import '/Paitent/Model/userdoctor_model.dart';
import 'package:get/get.dart';
import '/Paitent/screens/userApptBooking_screen.dart';

class userDoctorDetails extends StatelessWidget {
  const userDoctorDetails({Key? key, required this.doc}) : super(key: key);
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
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            userBottomUI(),
          ],
        ),
      ),
    );
  }

  Widget userBottomUI() {
    return Container(
      height: 710,
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
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
            margin: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.location_on_rounded),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "New York, USA",
                    style: TextStyle(fontSize: 16.5, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 30),
            child: const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 8, right: 20),
            child: Text(
              doc.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 10, top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "4.9",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                  ),
                ),
                
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Patients",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.groups_rounded),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "22k",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => ApptBooking(doc: doc));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 45, left: 20, right: 20),
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffEF716B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Book an Appointment",
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
    );
  }
}
