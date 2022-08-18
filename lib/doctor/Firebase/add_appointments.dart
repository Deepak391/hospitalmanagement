import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';

class AddAppointment {
  Future helpupdate(List<Appointment> appoint) async {
    for (int i = 0; i < appoint.length; i++) {
      await addappointments(appoint[i]);
    }
  }

  Future addappointments(Appointment appoint) async {
    final docuser =
        FirebaseFirestore.instance.collection('appointmentList').doc();

    final apppointment = Appointment(
      id: docuser.id,
      patient_name: appoint.patient_name,
      patient_age: appoint.patient_age,
      patient_gender: appoint.patient_gender,
      date_time: appoint.date_time,
      emergency: appoint.emergency,
      Done: appoint.Done,
      docImage: appoint.docImage,
      docName: appoint.docName,
      docSpecilization: appoint.docSpecilization,
      docStatus: appoint.docStatus,
      reshedule: appoint.reshedule,
      prescription: appoint.prescription,
      reservedDate: appoint.reservedDate,
      reservedTime: appoint.reservedTime,
      status: appoint.status,
      med: appoint.med,
      gmeet: appoint.gmeet,

    );
    final json = apppointment.toJson();

    await docuser.set(json);
  }
}
