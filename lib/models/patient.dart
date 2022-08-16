import 'package:myapp/models/appointment.dart';
import 'package:myapp/models/prescription.dart';

class Patient {
  String id;
  String name;
  String sex;
  String email;
  String? image;
  List<Appointment> appList;
  List<Prescription> presList;

  Patient({
    required this.email,
    required this.appList,
    required this.id,
    required this.image,
    required this.name,
    required this.presList,
    required this.sex,
  });
}
