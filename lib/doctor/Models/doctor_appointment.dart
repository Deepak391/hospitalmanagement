// ignore_for_file: non_constant_identifier_names

import '../Models/medicine.dart';
import 'package:intl/intl.dart';

class Appointment {
  final String docImage;
  final String docName;
  final String docSpecilization;
  bool docStatus;
  final String id;
  final String reservedDate;
  final String reservedTime;
  final String patient_name;
  final int patient_age;
  final String patient_gender;
  final DateTime date_time;
  final String gmeet;
  bool reshedule;
  final bool emergency;
  bool Done;
  final String status;
  final String prescription;
  final List med;
  Appointment({
    this.gmeet = "",
    this.status = "",
    this.docName = "",
    this.docImage = "",
    this.docSpecilization = "",
    this.reservedDate = "",
    this.reservedTime = "",
    this.docStatus = false,
    this.id = "",
    this.patient_name = "",
    this.patient_age = 0,
    this.patient_gender = "",
    DateTime? date_time,
    this.emergency = false,
    this.reshedule = false,
    this.Done = false,
    this.prescription = "",
    List? med,
  })  : med = med ?? [],
        date_time = date_time ?? DateTime.now();

  static List<Appointment> appointments = [
    Appointment(
      id: 'A002',
      patient_name: 'rohan Arora',
      patient_age: 18,
      patient_gender: 'Male',
      date_time: DateTime(2022, 8, 16, 10, 00),
      emergency: false,
      Done: false,
      docImage:
          "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/doctor_image%2Fdoctor2.png?alt=media&token=829e170f-d7e9-4f85-91c7-a528060f16f3",
      docName: "Dr. Joseph Cart",
      docSpecilization: "Eye Surgeon - Flower Hospitals",
      docStatus: true,
      prescription: "",
      med: [],
      reshedule: false,
      reservedDate: "Mon, Aug 13",
      reservedTime: "01:00 PM",
      status: 'Complete',
      gmeet: "",
    ),
    Appointment(
      id: 'ap2',
      patient_name: 'Asifkhan Arora',
      patient_age: 19,
      patient_gender: 'FeMale',
      date_time: DateTime(2022, 08, 16, 11, 00),
      emergency: false,
      Done: false,
      docImage:
          "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/doctor_image%2Fdoctor3.png?alt=media&token=6c008a7e-6b49-4808-a0b4-3256f82e9841",
      docName: "Dr. Joseph Cart",
      docSpecilization: "Dental Surgeon - Flower Hospitals",
      docStatus: false,
      prescription: "",
      med: [],
      reshedule: false,
      reservedDate: "Mon, Aug 15",
      reservedTime: "12:00 AM",
      status: 'Complete',
      gmeet: "",
    ),
    Appointment(
      id: 'A001',
      patient_name: 'Asifkhan Arora',
      patient_age: 20,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 12, 00),
      emergency: false,
      Done: false,
      docStatus: false,
      docName: "Dr. Stella Kane",
      docImage:
          "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/doctor_image%2Fdoctor1.png?alt=media&token=286953a5-e0e2-48fc-a42a-6f0910d365f3",
      docSpecilization: "General Physician - Flower Hospital",
      prescription: "",
      med: [],
      reshedule: false,
      reservedDate: "Mon, Aug 10",
      reservedTime: "12:00 PM",
      status: 'Complete',
      gmeet: "",
    ),
    Appointment(
      id: 'ap4',
      patient_name: 'rohan Arora',
      patient_age: 21,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 13, 00),
      emergency: false,
      Done: false,
      docStatus: false,
      docName: "Dr. David Kemp",
      docImage:
          "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/doctor_image%2Fdoctor2.png?alt=media&token=829e170f-d7e9-4f85-91c7-a528060f16f3",
      docSpecilization: "Heart Surgeon - Flower Hospitals",
      prescription: "",
      med: [],
      reshedule: false,
      status: "Complete",
      reservedDate: "Mon, Aug 13",
      reservedTime: "01:00 PM",
      gmeet: "",
    ),
  ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'patient_name': patient_name,
        'patient_age': patient_age,
        'patient_gender': patient_gender,
        'date_time': date_time,
        'emergency': emergency,
        'Done': Done,
        'docImage': docImage,
        'docName': docName,
        'docSpecilization': docSpecilization,
        'docStatus': docStatus,
        'reshedule': reshedule,
        'prescription': prescription,
        'reservedDate': reservedDate,
        'reservedTime': reservedTime,
        'status': status,
        'med': med,
        'gmeet': gmeet,
      };
  static Appointment fromJson(Map<String, dynamic> json) => Appointment(
        id: json['id'],
        patient_name: json['patient_name'],
        patient_age: json['patient_age'],
        patient_gender: json['patient_gender'],
        date_time: json['date_time'],
        emergency: json['emergency'],
        Done: json['Done'],
        docImage: json['docImage'],
        docName: json['docName'],
        docSpecilization: json['docSpecilization'],
        docStatus: json['docStatus'],
        reshedule: json['reshedule'],
        prescription: json['prescription'],
        reservedDate: json['reservedDate'],
        reservedTime: json['reservedTime'],
        status: json['status'],
        med: json['med'],
        gmeet: json['gmeet'],
      );
}
