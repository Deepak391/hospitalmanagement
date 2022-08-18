import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Screens/appointment_completed_list_screen.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_due_appointment_main.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_home.dart';
import 'package:hospital_management_system/doctor/widget/doctor_current_appointment.dart';
import 'package:hospital_management_system/doctor/widget/doctor_upcoming_appointment.dart';


class UpcomingAppointmentScreen extends StatelessWidget { 
  final DueAppointmentController controller = Get.find();
  
   UpcomingAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today Appoinments')),
      body:  UpcominhAppointment(),
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
                            onPressed: () => Get.off(() =>  DoctorHome()),
                          ),
                        const Padding( padding: const EdgeInsets.only(left: 10.0),
                            child: Text("DashBoard",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),)),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            iconSize: 30.0,
                            padding: const EdgeInsets.only(left: 5.0),
                            icon: const Icon(Icons.assessment),
                            onPressed: () => Get.off(() =>  DueMainScreen()),
                          ),
                          const Padding( padding: const EdgeInsets.only(left: 2.5),
                            child: Text("Due Appointmnet",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),)),
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
                            onPressed: () =>
                                Get.off(() =>  UpcomingAppointmentScreen()),
                          ),
                          const Padding( padding: const EdgeInsets.only(left: 0.0),
                            child: Text("Upcoming",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),)),
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
                            controller.listofappointmentsucess();
                            Get.off(
                                () =>  AppointmentCompletedScreen());
                          }),
                                const Padding( padding: const EdgeInsets.only(right: 5.0),
                            child: Text("Done",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ),)),
                        ],
                      ),
                      
                    ],),))
    );
  }
}
