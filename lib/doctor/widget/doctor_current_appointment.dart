import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_take_appointment_screen.dart';
import 'package:intl/intl.dart';

class help extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  help({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.checkcurrentappointment().patient_name.isEmpty) {
      return NoAppointmentCard();
    }
    return CurrentAppointmentCard();
  }
}
class NoAppointmentCard extends StatelessWidget {
  const NoAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class CurrentAppointmentCard extends StatelessWidget {
  // final int index;
  // final DueAppointmentController controller;
  final DueAppointmentController controller = Get.find();
  CurrentAppointmentCard({Key? key}) : super(key: key);

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
                      controller.checkcurrentappointment().patient_name,
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
                      controller
                          .checkcurrentappointment()
                          .patient_age
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
                      controller.checkcurrentappointment().patient_gender,
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
                      '${DateFormat.MMMEd().format(controller.checkcurrentappointment().date_time)} ${DateFormat.jm().format(controller.checkcurrentappointment().date_time)}',
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
                ElevatedButton(
                  onPressed: () => Get.to(() => TakeAppointmentScreen(
                        appoint: controller.checkcurrentappointment(),
                      )),
                  child: const Text('Start Appintment'),
                )
              ],
            ),
          ),
        ));
  }
}
