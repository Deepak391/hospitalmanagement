import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_api.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_paragraph_api.dart';
import 'package:intl/intl.dart';

class AppointmentCompleted extends StatelessWidget {
  final DueAppointmentController controller = Get.find();

  AppointmentCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: controller.appointmentcompleted.length,
          itemBuilder: (BuildContext ctx, index) {
            return AppointmentCompletedCard(
              index: index,
              controller: controller,
            );
          }),
    );
  }
}

class AppointmentCompletedCard extends StatelessWidget {
  final int index;
  final DueAppointmentController controller;
  const AppointmentCompletedCard(
      {required this.index, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.appointmentcompleted[index].patient_name,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AGE : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.appointmentcompleted[index].patient_age
                            .toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SEX : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.appointmentcompleted[index].patient_gender,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        '${DateFormat.MMMEd().format(controller.appointmentcompleted[index].date_time)} ${DateFormat.jm().format(controller.appointmentcompleted[index].date_time)}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Status : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        'Done',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                const SizedBox(width: 100),
                ElevatedButton(
                  child: const Text('View Prescription'),
                  onPressed: () async {
                    try {
                      PdfApi a = new PdfApi();
                      a.downloadFile(controller.appointmentcompleted[index].id);
                    } on Exception catch (e) {
                      // TODO
                      print(e);
                    }
                  },
                ),
                const SizedBox(width: 40),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
