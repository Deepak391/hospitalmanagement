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
    appointments([]);
    // try {
    var d = await FirebaseFirestore.instance
        .collection("appointmentList")
        .get()
        .then((value) {
      // print(value.docs);
      return value.docs;
    });

    d.forEach((ele) {
      print(ele.data()["date_time"]);
      var dt =
          DateTime.fromMicrosecondsSinceEpoch(ele.data()["date_time"].seconds)
              .millisecondsSinceEpoch;
      appointments.add(Appointment(
        id: ele.id,
        docName: ele.data()["docName"],
        docImage: ele.data()["docImage"],
        docSpecilization: ele.data()["docSpecilization"],
        reservedDate: ele.data()["reservedDate"],
        reservedTime: ele.data()["reservedTime"],
        date_time: dt,
        emergency: ele.data()["emergency"],
        docStatus: ele.data()["docStatus"],
        patientName: ele.data()["patient_name"],
      ));
    });

    appointments.sort((a, b) {
      return a.date_time.compareTo(b.date_time);
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
