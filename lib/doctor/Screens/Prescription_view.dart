import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_api.dart';
import 'package:hospital_management_system/doctor/Controller/pdf_paragraph_api.dart';
import 'package:hospital_management_system/doctor/Firebase/firebase_api.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Screens/doctor_home.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrescriptionView extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  UploadTask? task;
  File? file;
  String url =
      "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/prescription%2FsViZHulBbxMOxZsP7Vnw?alt=media&token=b50ca22e-d12e-4263-9346-4d2d06a3ebcb";
  Appointment appoint;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PrescriptionView({required this.appoint, super.key});
  TextEditingController temptext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Prescription"),
        actions: [
          // ElevatedButton(
          //     onPressed: () async {
          //       final pdfFile = await PdfParagraphApi.generate(
          //           controller.helpofpdf(appoint));

          //       PdfApi.openFile(pdfFile);
          //     }, child: const Text('Prescription'),
          //       ),
          ElevatedButton(
              onPressed: () async {
                  final pdfFile = await PdfParagraphApi.generate(
                      controller.helpofpdf(controller.finalmed),appoint.patient_name,appoint.patient_name,appoint.patient_age.toString(),appoint.date_time.toString());
                  file = pdfFile;
                   uploadFile(appoint.id);
                controller.finalsubmit(appoint);
                controller.makeappointmentdone(appoint);
                Get.offAll(() => DoctorHome());
              },
              child: const Text("Submit"))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "More Suggestion"),
              controller: temptext,
            ),
            RaisedButton(
              // padding: RenderSliverEdgeInsetsPadding,
              color: Colors.green,
              child: const Text("Add Suggestion"),
              onPressed: () {
                // controller.login(
                //     emailController.text, passwordController.text);
              },
            ),

            TextButton(
                child: const Text(
                  'Upload File',
                ),
                onPressed: () async {
                  final pdfFile = await PdfParagraphApi.generate(
                      controller.helpofpdf(controller.finalmed),appoint.patient_name,appoint.patient_name,appoint.patient_age.toString(),appoint.date_time.toString());
                  file = pdfFile;
                  // PdfApi.openFile(pdfFile);
                  uploadFile(appoint.id);
                }),
            // SizedBox(height: 20),
            // task != null ? buildUploadStatus(task!) : Container(),
            // SizedBox(height: 20),
            // TextButton(
            //     child: const Text(
            //       'view File',
            //     ),
            //     onPressed: () async {
            //       final file = await PdfApi.loadNetwork(url);
            //       PdfApi.openFile(file);
                  // file pdfFile = await SfPdfViewer.network(url);
                  // PdfApi.openFile(pdfFile);
                // })

            // const SizedBox(
            //   height: 300,
            // ),
            // Row(
            //   children: [
            //     const Text("Before Submit Check The Prescription"),
            //     ElevatedButton(
            //   onPressed: () async {
            //     final pdfFile = await PdfParagraphApi.generate(
            //         controller.helpofpdf(appoint));

            //     PdfApi.openFile(pdfFile);
            //   }, child: const Text('Prescription'),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            // color: Colors.black26,
            height: 65,
            child: ElevatedButton(
              onPressed: () async {
                final pdfFile = await PdfParagraphApi.generate(
                    controller.helpofpdf(controller.finalmed),appoint.patient_name,appoint.patient_name,appoint.patient_age.toString(),appoint.date_time.toString());

                PdfApi.openFile(pdfFile);
              },
              child: const Text('Prescription'),
            ),
          )),
    );
  }

  Future uploadFile(String name) async {
    print("as");
    if (file == null) return;
    print("as");
    final fileName = name;
    final destination = 'prescription/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    // @override
    // setState();

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    url = urlDownload;

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            );
          } else {
            return Container();
          }
        },
      );
}
