import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_api.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_paragraph_api.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Screens/Medicine_view_screen.dart';

class TakeAppointmentScreen extends StatelessWidget {
  Appointment appoint; 
   TakeAppointmentScreen({required this.appoint,Key? key}) : super(key: key);
   final TextEditingController gmeettext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step1'),
      ),
      body: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                decoration: const InputDecoration(hintText: "Gmeet Link"),
                controller: gmeettext,
              ),
              RaisedButton(
                child:  Text("Send Link"),
                onPressed: () {
                  // controller.login(
                  //     emailController.text, passwordController.text);
                },
              ),
              // ElevatedButton(onPressed: () async {
              //       final pdfFile =
              //           await PdfApi.generateCenteredText('Sample Text');

              //       PdfApi.openFile(pdfFile);
              //     }, child:const Text('as')),
                 
          ],
        ),
        SizedBox(
          height: 250,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Back")),
              SizedBox(
                width: 200,
              ),
              ElevatedButton(onPressed: () => Get.to(() =>  MedicineViewScreen(appoint: appoint,)), child: const Text("Next"))
            ],
          ),
        )
      ]),
    );
  }
}
