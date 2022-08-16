import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/due_appointment_controller.dart';

class UpcominhAppointment extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  UpcominhAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: controller.upcomingappoint.length,
          itemBuilder: (BuildContext ctx, index) {
            return UpcomingAppointmentCard(
              index: index,
              controller: controller,
            );
          }),
    );
  }
}

class UpcomingAppointmentCard extends StatelessWidget {
  final int index;
  final DueAppointmentController controller;
  const UpcomingAppointmentCard(
      {required this.index, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: Card(
          elevation: 10,
          child: Container(
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
                      controller.upcomingappoint[index].patient_name,
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
                      controller.upcomingappoint[index].patient_age.toString(),
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
                      controller.upcomingappoint[index].patient_gender,
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
                      '${DateFormat.MMMEd().format(controller.upcomingappoint[index].date_time)} ${DateFormat.jm().format(controller.upcomingappoint[index].date_time)}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
