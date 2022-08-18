import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../Controller/due_appointment_controller.dart';
import '../Controller/pdf_api.dart';
import '../Controller/pdf_paragraph_api.dart';
import '../Models/doctor_appointment.dart';
import '../Screens/Medicine_view_screen.dart';

class TakeAppointmentScreen extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  Appointment appoint;
  TakeAppointmentScreen({required this.appoint, Key? key}) : super(key: key);
  final TextEditingController gmeettext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step1'),
        actions: [
          // const Text("Next",style: TextStyle(fontSize: 25),),
          ElevatedButton(
              onPressed: () => Get.to(() => MedicineViewScreen(
                    appoint: appoint,
                  )),
              child: const Text("Next")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Gmeet Link"),
              controller: gmeettext,
            ),
            RaisedButton(
              // padding: RenderSliverEdgeInsetsPadding,
              color: Colors.green,
              child: Text("Send Link"),
              onPressed: () => controller.acceptgmeet(appoint, gmeettext.text),
            ),
          ],
        ),
      ),
    );
  }
}
