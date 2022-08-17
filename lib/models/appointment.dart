import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  String id;
  String docName;
  String docImage;
  String docSpecilization;
  String reservedDate;
  String reservedTime;
  bool emergency;
  bool docStatus;
  Timestamp date_time;
  // String status;
  String patientName;

  Appointment({
    required this.id,
    required this.docName,
    required this.docImage,
    required this.date_time,
    required this.docSpecilization,
    required this.reservedDate,
    required this.reservedTime,
    required this.emergency,
    required this.docStatus,
    // required this.status,
    required this.patientName,
  });
}
