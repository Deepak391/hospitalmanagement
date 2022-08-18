import 'dart:io';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Models/medicine.dart';

import 'pdf_api.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  // final Appointment appoint;
  // PdfParagraphApi({
  //   required this.appoint,
  // });
  // final List<Medicine>medicine=DueAppointmentController.helpofpdf(appoint);
  static Future<File> generate(List<Medicine> med,String Docname,String pname,String page,String time) async {
    final pdf = Document();
    final medicine = med;
    final customFont =
        Font.ttf(await rootBundle.load('assests/OpenSans-Regular.ttf'));

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          buildCustomHeader(Docname,pname,page,time),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          ListView.builder(
              itemCount: medicine.length,
              itemBuilder: (Context context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [Paragraph(text: 'Medicine Name - ${medicine[index].name}'),]
                        ),
                      ],
                    ),
                    Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Row(children: [Paragraph(text: 'Use - '),]
                        ),
                        
                      ],
                    ),
                  ],
                );
              }),

        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    return PdfApi.saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Widget buildCustomHeader(String Docname,String pname,String page,String time) => Container(
      padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              PdfLogo(),
              SizedBox(width: 0.5 * PdfPageFormat.cm),
              Text(
                'Prescription',
                style: TextStyle(fontSize: 20, color: PdfColors.blue),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(children: [Text('Doctor Name : '), Text(Docname)]),
          SizedBox(height: 10),
          Row(children: [
            Text('Patient Name : '),
            Text(pname),
            SizedBox(width: 25),
            Text('Patient Age : '),
            Text(page),
            SizedBox(width: 25),
            Text('Patient Sex : '),
            Text('Male')
          ]),
          SizedBox(height: 10),
          Row(children: [Text('Date : '), Text(time)])
        ],
      ));

  static Widget buildCustomHeadline() => Header(
        child: Text(
          'My Third Headline',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(color: PdfColors.red),
      );

  static Widget buildLink() => UrlLink(
        destination: 'https://flutter.dev',
        child: Text(
          'Go to flutter.dev',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          ),
        ),
      );

  static List<Widget> buildBulletPoints() => [
        Bullet(text: 'First Bullet'),
        Bullet(text: 'Second Bullet'),
        Bullet(text: 'Third Bullet'),
      ];
}
