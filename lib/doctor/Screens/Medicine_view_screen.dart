import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Screens/Prescription_view.dart';
import 'package:hospital_management_system/doctor/widget/medicine_screen.dart';

class MedicineViewScreen extends StatelessWidget {
  Appointment appoint;
  MedicineViewScreen({required this.appoint,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Store"),
        actions: [
          ElevatedButton(
              onPressed: () => Get.to(() => PrescriptionView(appoint: appoint,)),
              child: const Text("Next"))
        ],
      ),
      body: MedicineScreen(appoint: appoint,),
    );
  }
}
