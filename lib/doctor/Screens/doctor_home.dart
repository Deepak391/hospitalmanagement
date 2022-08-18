import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/appointment_controller.dart';
import '../Firebase/add_appointments.dart';
import '../Models/doctor_appointment.dart';
import '../Screens/appointment_completed_list_screen.dart';
import '../Screens/doctor_upcoming_appointment.dart';
import '../widget/doctor_current_appointment.dart';
import 'package:intl/intl.dart';
import '../Controller/due_appointment_controller.dart';
import '../widget/doctor_due_appointment.dart';
import 'doctor_due_appointment_main.dart';

class DoctorHome extends StatelessWidget {
  static const routeName = "/doctorHome";
  final DueAppointmentController dueappointmentController =
      Get.put(DueAppointmentController());
  final AddAppointment temp = new AddAppointment();

  DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          // actions: [
          //   ElevatedButton(
          //       onPressed: () {
          //         dueappointmentController.checkcurrentappointment();
          //         Get.to(() => help());
          //       },
          //       child: const Text("current"))
          // ],
        ),
        body: Column(
          children: [
            help(),
            // CurrentAppointment(),
            // help(),
            // ElevatedButton(
            //     child: const Text("Add Appointment"),
            //     onPressed: () =>
            //         dueappointmentController.notacceptappointmentlist()),
            ElevatedButton(
                child: const Text("Add Appointment"),
                onPressed: () async =>
                    await temp.helpupdate(Appointment.appointments)),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              // color: Colors.black26,
              height: 65,
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30.0,
                          padding: const EdgeInsets.only(left: 10.0),
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.task,
                          ),
                          onPressed: () {
                            dueappointmentController.checkcurrentappointment();
                            Get.offAll(() => DoctorHome());
                          }),
                      const Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "DashBoard",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 30.0,
                        padding: const EdgeInsets.only(left: 5.0),
                        icon: const Icon(Icons.assessment),
                        onPressed: () {
                          dueappointmentController.notacceptappointmentlist();
                          Get.off(() => DueMainScreen());
                        },
                      ),
                      const Padding(
                          padding: const EdgeInsets.only(left: 2.5),
                          child: Text(
                            "Due Appointmnet",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30.0,
                          padding: const EdgeInsets.only(right: 3.0),
                          icon: const Icon(
                            Icons.event_available,
                          ),
                          onPressed: () {
                            dueappointmentController.adduppcomingappointlist();
                            Get.off(() => UpcomingAppointmentScreen());
                          }),
                      const Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30.0,
                          padding: const EdgeInsets.only(right: 5.0),
                          icon: const Icon(
                            Icons.done_outline,
                          ),
                          onPressed: () {
                            dueappointmentController.listofappointmentsucess();

                            Get.off(() => AppointmentCompletedScreen());
                          }),
                      const Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            )));
  }
}
