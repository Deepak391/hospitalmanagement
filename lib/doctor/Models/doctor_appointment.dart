// ignore_for_file: non_constant_identifier_names

import 'package:hospital_management_system/doctor/Models/medicine.dart';
import 'package:intl/intl.dart';

class Appointment {
  final String id;
  final String patient_name;
  final int patient_age;
  final String patient_gender;
  final DateTime date_time;
  bool reshedule;
  final bool emergency;
  bool accept;
  bool status;
  final String prescription;
  final List<Medicine> med;
  Appointment({
    this.id = "",
    this.patient_name = "",
    this.patient_age = 0,
    this.patient_gender = "",
    DateTime? date_time,
    this.emergency = false,
    this.reshedule = false,
    this.accept = false,
    this.status = false,
    this.prescription = "", 
    List<Medicine>? med,
  }
  ) : med=med??[],
      date_time = date_time ?? DateTime.now();

  static List<Appointment> appointments = [
    Appointment(
      id: 'ap1',
      patient_name: 'rohan Arora',
      patient_age: 18,
      patient_gender: 'Male',
      date_time: DateTime(2022, 8, 16, 10, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap2',
      patient_name: 'Asifkhan Arora',
      patient_age: 19,
      patient_gender: 'FeMale',
      date_time: DateTime(2022, 08, 16, 11, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap3',
      patient_name: 'Asifkhan Arora',
      patient_age: 20,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 12, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap4',
      patient_name: 'rohan Arora',
      patient_age: 21,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 13, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 22,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 14, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 23,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 15, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 24,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 16, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 25,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 17, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 26,
      patient_gender: 'Male',
      date_time: DateTime(2022, 8, 16, 18, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 27,
      patient_gender: 'Male',
      date_time: DateTime(2022, 8, 16, 19, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 28,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 20, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 29,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 21, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 30,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 22, 00),
      emergency: false,
      accept: false,
    ),
    Appointment(
      id: 'ap5',
      patient_name: 'rohan Arora',
      patient_age: 31,
      patient_gender: 'Male',
      date_time: DateTime(2022, 08, 16, 23, 00),
      emergency: false,
      accept: false,
    ),
  ];
}
