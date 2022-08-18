import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_take_appointment_screen.dart';
import 'package:intl/intl.dart';

class help extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  help({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.checkcurrentappointment().Done) {
      if (controller.checkcurrentappointment().patient_age == 0) {
      return const NoAppointmentCard();
    }
      return CurrentAppointmentCard(
          appoint: controller.checkcurrentappointment());
    }
    return const CompletedAppointmentNotificationCard();
  }
}

class NoAppointmentCard extends StatelessWidget {
  const NoAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Card(
          elevation: 10,
          child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text("At a Time You have No Appointments"),
                  ]))),
    );
  }
}

class CompletedAppointmentNotificationCard extends StatelessWidget {
  const CompletedAppointmentNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 600,
        child: Card(
            elevation: 10,
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text("Appointment Already Done."),
                    ]))));
  }
}

class CurrentAppointmentCard extends StatelessWidget {
  // final int index;
  // final DueAppointmentController controller;
  final DueAppointmentController controller = Get.find();
  final Appointment appoint;
  CurrentAppointmentCard({required this.appoint, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
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
                      appoint.patient_name,
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
                      appoint.patient_age.toString(),
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
                      appoint.patient_gender,
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
                      '${DateFormat.MMMEd().format(appoint.date_time)} ${DateFormat.jm().format(appoint.date_time)}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 158.00),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => Get.to(() => TakeAppointmentScreen(
                              appoint: controller.currentappoint,
                            )),
                        icon: const Icon(
                          Icons.start_rounded,
                        ),
                        label: const Text("Start Appointment"),
                        //  const Text('Start Appintment'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
