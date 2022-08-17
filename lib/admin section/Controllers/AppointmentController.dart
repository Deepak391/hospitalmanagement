import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/appointment.dart';

import '../../models/doctor.dart';

class AppointmentController extends GetxController with StateMixin {
  var appointments = <Appointment>[].obs;
  var doctor = <Doctor>[].obs;

  var selectedTiming = "".obs;
  var selectedDay = "".obs;

  final Timings = [
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
    "06:00 PM",
    "07:00 PM",
    "08:00 PM"
  ];

  var days = [].obs;

  final today = DateFormat.MMMEd().format(DateTime.now());

  resheduleApp(String id) async {
    Get.back();

    try {
      await FirebaseFirestore.instance
          .collection("appointmentList")
          .doc(id)
          .update({
        "reservedTime": selectedTiming.value,
        "reservedDate": selectedDay.value,
        "reshedule": true,
      }).then((value) {
        print("Reshedule Successfull.");
        // Get.back();
        Get.snackbar("Success", "Appointment resheduled successfully.");
      });
    } catch (e) {
      Get.snackbar("Error", "Error resheduling the appointment.");
    }
  }

  setDays() {
    print(today);
    days.add(today);

    for (int i = 0; i < 6; i++) {
      var d = DateFormat.MMMEd().format(new DateTime(DateTime.now().year,
          DateTime.now().month, DateTime.now().day + 1 + i));
      days.add(d);
    }

    print(days);
  }

  getAppointments() async {
    // try {
    var d = await FirebaseFirestore.instance
        .collection("appointmentList")
        .get()
        .then((value) {
      // print(value.docs);
      return value.docs;
    });

    d.forEach((ele) {
      // print(ele.data());
      var d = DateFormat("hh:mm a").format(ele.data()["date_time"].toDate());

      var m = DateFormat("dd MM yyyy").format(ele.data()["date_time"].toDate());
      // print(d.runtimeType);
      appointments.add(Appointment(
        id: ele.id,
        docName: ele.data()["docName"],
        docImage: ele.data()["docImage"],
        docSpecilization: ele.data()["docSpecilization"],
        reservedDate: m,
        reservedTime: d,
        date_time: ele.data()["date_time"],
        emergency: ele.data()["emergency"],
        docStatus: ele.data()["docStatus"],
        patientName: ele.data()["patient_name"],
      ));
    });

    appointments.sort((a, b) {
      var d = DateFormat("dd MM yyyy hh:mm a")
          .format((a.date_time as Timestamp).toDate());

      var m = DateFormat("dd MM yyyy hh:mm a")
          .format((b.date_time as Timestamp).toDate());

      // print(d.compareTo(m));
      return d.compareTo(m);
    });

    print(appointments);
    change(appointments, status: RxStatus.success());
    // } catch (e) {
    // print(e as Error);
    // change("Error", status: RxStatus.error());
    // }
  }

  getDocs() async {
    try {
      var d = await FirebaseFirestore.instance
          .collection("userDoctor")
          .get()
          .then((value) {
        // print(value.docs);
        return value.docs;
      });

      d.forEach((ele) {
        doctor.add(Doctor(
          description: ele.data()["description"],
          image: ele.data()["image"],
          name: ele.data()["name"],
          specialization: ele.data()["specialization"],
          type: ele.data()["type"],
        ));
      });

      print(doctor);
    } catch (e) {
      change("Error", status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    getAppointments();
    getDocs();
    setDays();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
