import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/doctor_appointment.dart';
import '../Screens/Prescription_view.dart';
import '../widget/medicine_screen.dart';

class MedicineViewScreen extends StatelessWidget {
  Appointment appoint;
  MedicineViewScreen({required this.appoint, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Store"),
        actions: [
          ElevatedButton(
              onPressed: () => Get.to(() => PrescriptionView(
                    appoint: appoint,
                  )),
              child: const Text("Next"))
        ],
      ),
      body: MedicineScreen(
        appoint: appoint,
      ),
    );
  }
}
