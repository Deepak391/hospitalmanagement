import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Screens/appointment_completed_list_screen.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_home.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_upcoming_appointment.dart';
import 'package:hospital_management_system/doctor/widget/doctor_current_appointment.dart';

import '../widget/doctor_due_appointment.dart';

class DueMainScreen extends StatelessWidget {
  const DueMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Due Appoinments')),
      body:  DueAppointment(),
      bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                // color: Colors.black26,
                height: 45,
                child: Row(

                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        iconSize: 30.0,
                        padding: const EdgeInsets.only(left: 20.0),
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.task,
                        ),
                        onPressed: () => Get.offAll(() =>  DoctorHome()),
                      ),
                      IconButton(
                        iconSize: 30.0,
                        padding: const EdgeInsets.only(left: 20.0),
                        icon: const Icon(Icons.assessment),
                        onPressed: () => Get.offAll(() => const DueMainScreen()),
                      ),
                      IconButton(
                        iconSize: 30.0,
                        padding: const EdgeInsets.only(right: 5.0),
                        icon: const Icon(
                          Icons.event_available,
                        ),
                        onPressed: () =>
                            Get.offAll(() => const UpcomingAppointmentScreen()),
                      ),
                      IconButton(
                          iconSize: 30.0,
                          padding: const EdgeInsets.only(right: 10.0),
                          icon: const Icon(
                            Icons.done_outline,
                          ),
                          onPressed: () =>
                            Get.offAll(() => const AppointmentCompletedScreen())),
                      IconButton(
                          iconSize: 30.0,
                          padding: const EdgeInsets.only(right: 15.0),
                          icon: const Icon(
                            Icons.add_shopping_cart,
                          ),
                          onPressed: () =>
                            Get.offAll(() =>  CurrentAppointmentCard()),),
                    ],),))
    );
  }
}
