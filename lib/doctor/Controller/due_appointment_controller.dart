// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Models/medicine.dart';
import 'package:intl/intl.dart';

import '../Models/doctor_appointment.dart';

class DueAppointmentController extends GetxController {
  final _dueappoint = [].obs;
  final _upcomingappoint = [].obs;
  final _acceptedappointlist = [].obs;
  final _appointmentcompleted = [].obs;
  final _getallmedicine = [].obs;
  List<Medicine> finalmed = [];
  RxList getallappointment = [].obs;
  Appointment temp = new Appointment();

  @override
  void onInit() {
    super.onInit();
    notacceptappointmentlist();
    adduppcomingappointlist();
    listofappointmentsucess();
    allappointments();
    getallmodicine();
  }

  void getallmodicine() async {
    final List<Medicine> items = [];

    final data = await FirebaseFirestore.instance
        .collection('medicines')
        .get()
        .then((value) => value.docs);

    data.forEach((e) {
      items.add(Medicine(
        id: e.id,
        name: e['name'],
        quantity: e['quantity'],
      ));
    });
    _getallmedicine.value = [];
    for (int i = 0; i < items.length; i++) {
      _getallmedicine.add(items[i]);
    }
  }

  void allappointments() async {
    final List<Appointment> items = [];

    final data = await FirebaseFirestore.instance
        .collection('appointmentList')
        .where("docStatus", isEqualTo: true)
        .get()
        .then((value) => value.docs);
    // final sdata = jsonDecode(data.body) as Map<String, dynamic>;

    data.forEach((e) {
      items.add(Appointment(
        id: e.id,
        Done: e['Done'],
        patient_name: e['patient_name'],
        patient_age: e['patient_age'],
        patient_gender: e['patient_gender'],
        date_time: (e['date_time'] as Timestamp).toDate(),
        emergency: e['emergency'],
      ));
    });
    getallappointment.value = [];
    for (int i = 0; i < items.length; i++) {
      getallappointment.add(items[i]);
    }
  }

  void notacceptappointmentlist() async {
    final List<Appointment> items = [];

    final data = await FirebaseFirestore.instance
        .collection('appointmentList')
        .where("docStatus", isEqualTo: false)
        .get()
        .then((value) => value.docs);
    // final sdata = jsonDecode(data.body) as Map<String, dynamic>;

    data.forEach((e) {
      items.add(Appointment(
        id: e.id,
        Done: e['Done'],
        patient_name: e['patient_name'],
        patient_age: e['patient_age'],
        patient_gender: e['patient_gender'],
        date_time: (e['date_time'] as Timestamp).toDate(),
        emergency: e['emergency'],
      ));
    });
    _dueappoint.value = [];
    for (int i = 0; i < items.length; i++) {
      if (!_dueappoint.contains(items[i].id)) {
        _dueappoint.add(items[i]);
      }
    }
  }

//when appointment accept
  void acceptappointment(Appointment appoint) async {
    if (!appoint.docStatus) {
      appoint.docStatus = true;
      await FirebaseFirestore.instance
          .collection('appointmentList')
          .doc(appoint.id)
          .update({'docStatus': true});
      _dueappoint.remove(appoint);
      appointment(appoint);
      Get.snackbar(
        "Appointment Accepted",
        "",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1200),
        backgroundColor: Colors.white70,
      );
    }
  }

  //add on acceptedappointmentlist
  void appointment(Appointment appoint) {
    if (appoint.Done) {
      _acceptedappointlist.add(appoint);
    }
  }

//Use for fetch Appointment for upcoming for today only
  void adduppcomingappointlist() async {
    final List<Appointment> items = [];
    final data = await FirebaseFirestore.instance
        .collection('appointmentList')
        .where("docStatus", isEqualTo: true)
        .get()
        .then((value) => value.docs);
    // final sdata = jsonDecode(data.body) as Map<String, dynamic>;

    data.forEach((e) {
      items.add(Appointment(
        id: e.id,
        Done: e['Done'],
        patient_name: e['patient_name'],
        patient_age: e['patient_age'],
        patient_gender: e['patient_gender'],
        date_time: (e['date_time'] as Timestamp).toDate(),
        emergency: e['emergency'],
      ));
    });
    _upcomingappoint.value = [];
    for (int i = 0; i < items.length; i++) {
      DateTime a = DateTime.now();
      if (Aftercurrenttime(a, items[i].date_time)) {
        {
          _upcomingappoint.add(items[i]);
        }
      }
    }
  }

//its helper function for upcomingappointmentlist
  bool Aftercurrenttime(DateTime a, DateTime b) {
    if (a.difference(b).inDays == 0) {
      if (b.difference(a).inMinutes >= 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

//its use for currenttimeappointment
  Appointment checkcurrentappointment() {
    temp = new Appointment();
    DateTime a = DateTime.now();
    for (int i = 0; i < getallappointment.length; i++) {
      print(getallappointment[i].date_time);
      if (samedatetime(a, getallappointment[i].date_time)) {
        return getallappointment[i];
      }
    }
    return temp;
  }

  void acceptgmeet(Appointment appoint, String text) async {
    if (!appoint.docStatus) {
      appoint.docStatus = true;
      await FirebaseFirestore.instance
          .collection('appointmentList')
          .doc(appoint.id)
          .update({'gmeet': text});
      Get.snackbar(
        "Meeting Link send",
        "",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 1200),
        backgroundColor: Colors.white70,
      );
    }
  }

//helper function for checkcurrentappointment
  bool samedatetime(DateTime a, DateTime b) {
    if (a.difference(b).inDays == 0) {
      if (b.difference(a).inHours == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void makeappointmentdone(Appointment appoint) async{
    await FirebaseFirestore.instance
          .collection('appointmentList')
          .doc(appoint.id)
          .update({'Done': true});
          
  }

  void listofappointmentsucess() async {
    final List<Appointment> items = [];
    final data = await FirebaseFirestore.instance
        .collection('appointmentList')
        .where("Done", isEqualTo: true)
        .get()
        .then((value) => value.docs);
    // final sdata = jsonDecode(data.body) as Map<String, dynamic>;

    data.forEach((e) {
      items.add(Appointment(
        id: e.id,
        Done: e['Done'],
        patient_name: e['patient_name'],
        patient_age: e['patient_age'],
        patient_gender: e['patient_gender'],
        date_time: (e['date_time'] as Timestamp).toDate(),
        emergency: e['emergency'],
      ));
    });
    _appointmentcompleted.value = [];
    for (int i = 0; i < items.length; i++) {
      _appointmentcompleted.add(items[i]);
    }
  }

  void finalsubmit(Appointment appoint) async {
    // helpofpdf(appoint);
    List medis = [];
    for (int i = 0; i < finalmed.length; i++) {
      medis.add(finalmed[i].id);
    }
    await FirebaseFirestore.instance
        .collection('appointmentList')
        .doc(appoint.id)
        .update({"med": medis});
    Get.snackbar(
      "Appointment Done",
      "",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.white70,
    );
  }

  void addmedicine(Medicine med, int Quantity, String text) {
    Medicine temp = new Medicine(
        id: med.id, name: med.name, quantity: Quantity, useof: text);
    finalmed.add(temp);
    print(temp);
  }

  List<Medicine> helpofpdf(List<Medicine>med) {
    List<Medicine> result = [];
    for (int i = 0; i <med.length; i++) {
      result.add(med[i]);
    }
    return result;
  }

  get appointmentcompleted => _appointmentcompleted;
  get upcomingappoint => _upcomingappoint;
  get dueappoint => _dueappoint;
  get currentappoint => temp;
  get allmedicine => _getallmedicine;
}
