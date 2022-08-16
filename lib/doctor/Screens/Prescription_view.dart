import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_api.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_paragraph_api.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_home.dart';

class PrescriptionView extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  Appointment appoint;
  PrescriptionView({required this.appoint, super.key});
  TextEditingController temptext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription"),
        actions: [
          ElevatedButton(
              onPressed: () {
                controller.makeappointmentdone(appoint);
                Get.offAll(() => DoctorHome());
              },
              child: const Text("Submit"))
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 600,
          width: 500,
          child: Card(
            child: Column(
              children: [
                TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Direction to use"),
                        controller: temptext,
                      ),
                const Text("see the Prescription"),
                 ElevatedButton(onPressed: () async {
                    final pdfFile = await PdfParagraphApi.generate(controller.helpofpdf(appoint));

                    PdfApi.openFile(pdfFile);
                  }, child:const Text('Paragraphs PDF')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
