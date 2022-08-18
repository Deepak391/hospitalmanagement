// import 'package:get/get.dart';
// import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';

// class AppointmentController extends GetxController {
//   final List _appointments = [].obs;

//   void addappoointments(List<Appointment> appoint) {
//     for (int i = 0; i < appoint.length; i++) {
//       _appointments.add(appoint[i]);
//     }
//   }

//   List<Appointment> notacceptappointmentlist() {
//     final List<Appointment> result = [];
//     for (int i = 0; i < _appointments.length; i++) {
//       if (!_appointments[i].accept) {
//         result.add(_appointments[i]);
//       }
//     }
//     return result;
//   }

//   void acceptappointment(Appointment appoint) {
//     if (!appoint.accept) {
//       appoint.accept = true;
//       notacceptappointmentlist();
//     }
//   }

//   get appointments => _appointments;
// }
