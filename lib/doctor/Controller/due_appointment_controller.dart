// ignore_for_file: unnecessary_new

import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Models/medicine.dart';
import 'package:intl/intl.dart';

import '../Models/doctor_appointment.dart';

class DueAppointmentController extends GetxController {
  final _dueappoint = [].obs;
  final _upcomingappoint = [].obs;
  final _acceptedappointlist = [].obs;
  final _appointmentcompleted = [].obs;
  Appointment temp = new Appointment();
  //list of appointment not accepted
  void notacceptappointmentlist() {
    for (int i = 0; i < Appointment.appointments.length; i++) {
      if (!Appointment.appointments[i].accept) {
        _dueappoint.add(Appointment.appointments[i]);
      }
    }
  }

//when appointment accept
  void acceptappointment(Appointment appoint) {
    if (!appoint.accept) {
      appoint.accept = true;
      _dueappoint.remove(appoint);
      appointment(appoint);
    }
  }

  //add on acceptedappointmentlist
  void appointment(Appointment appoint) {
    if (appoint.accept) {
      _acceptedappointlist.add(appoint);
      adduppcomingappointlist(appoint);
    }
  }

//Use for fetch Appointment for upcoming for today only
  void adduppcomingappointlist(Appointment appoint) {
    DateTime a = DateTime.now();
    if (Aftercurrenttime(a, appoint.date_time)) {
      _upcomingappoint.add(appoint);
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
    DateTime a = DateTime.now();
    for (int i = 0; i < _acceptedappointlist.length; i++) {
      if (samedatetime(a, _acceptedappointlist[i].date_time)) {
        temp = _acceptedappointlist[i];
        break;
      }
    }
    return temp;
  }

//helper function for checkcurrentappointment
  bool samedatetime(DateTime a, DateTime b) {
    String as1 = DateFormat('dd-MM-yyyy kk').format(a);
    String as2 = DateFormat('dd-MM-yyyy kk').format(b);
    if (as1 == as2) {
      return true;
    } else {
      return false;
    }
  }

  void makeappointmentdone(Appointment appoint) {
    appoint.status = true;
  }

  void listofappointmentsucess() {
    if (checkcurrentappointment().status) {
      _appointmentcompleted.add(checkcurrentappointment());
    }
  }

  void addmedicine(Appointment appoint, String name, String text) {
    appoint.med.add(Medicine(name: name, desc: text));
  }
   
  List<Medicine> helpofpdf(Appointment appoint) {
    List<Medicine> result = [];
    for (int i = 0; i < appoint.med.length; i++) {
      result.add(appoint.med[i]);
    }
    return result;
  }

  get appointmentcompleted => _appointmentcompleted;
  get upcomingappoint => _upcomingappoint;
  get dueappoint => _dueappoint;
}
