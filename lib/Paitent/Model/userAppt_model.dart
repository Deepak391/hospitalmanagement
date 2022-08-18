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

  // static List<Appointment> ScheduledAppointments = [
  //   Appointment(
  //     "A001",
  //     "Dr. Stella Kane",
  //     "assets/images/doctor1.png",
  //     "General Physician - Flower Hospital",
  //     "Mon, Aug 11",
  //     "11:00 AM",
  //     false,
  //     true,
  //     "Upcoming",
  //   ),
  //   Appointment(
  //     "A004",
  //     "Dr. David Kemp",
  //     "assets/images/doctor1.png",
  //     "Heart Surgeon - Flower Hospitals",
  //     "Mon, Aug 15",
  //     "12:00 AM",
  //     false,
  //     false,
  //     "Upcoming",
  //   ),
  //   Appointment(
  //     "A002",
  //     "Dr. Joseph Cart",
  //     "assets/images/doctor2.png",
  //     "Eye Surgeon - Flower Hospitals",
  //     "Mon, Aug 10",
  //     "12:00 PM",
  //     true,
  //     true,
  //     "Complete",
  //   ),
  //   Appointment(
  //     "A003",
  //     "Dr. Stephanie",
  //     "assets/images/doctor3.png",
  //     "Dental Surgeon - Flower Hospitals",
  //     "Mon, Aug 13",
  //     "01:00 PM",
  //     false,
  //     false,
  //     "Cancel",
  //   ),
  // ];
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
