import 'package:cloud_firestore/cloud_firestore.dart';

enum ApptFilterStatus { Upcoming, Complete, Cancel }

class Appointment {
  String id;
  String docName;
  String docId;
  String docImage;
  String docSpecilization;
  String patient_name;
  String patient_age;
  String patient_gender;
  String gmeet;
  bool reshedule;
  bool Done;
  String prescription;
  List med;
  String reservedDate;
  String reservedTime;
  bool emergency;
  bool docStatus;
  String status;
  Timestamp date_time;

  Appointment(
    this.id,
    this.docName,
    this.docId,
    this.docImage,
    this.docSpecilization,
    this.patient_name,
    this.patient_age,
    this.patient_gender,
    this.gmeet,
    this.reshedule,
    this.Done,
    this.prescription,
    this.med,
    this.reservedDate,
    this.reservedTime,
    this.emergency,
    this.docStatus,
    this.status,
    this.date_time,
  );

}

class ApptFilterStatustype {
  final ApptFilterStatus status;

  ApptFilterStatustype(this.status);

  static List<ApptFilterStatustype> categories = [
    ApptFilterStatustype(ApptFilterStatus.Upcoming),
    ApptFilterStatustype(ApptFilterStatus.Complete),
    ApptFilterStatustype(ApptFilterStatus.Cancel),
  ];
}
