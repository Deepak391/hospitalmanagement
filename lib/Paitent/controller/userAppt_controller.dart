import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Model/userAppt_model.dart';
import 'package:flutter/material.dart';
import 'package:xid/xid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApptController extends GetxController {
  var indexDaytime = 0.obs;
  var currentIndex = 0.obs;
  final emergencyIsSelected = false.obs;
  final regularIsSelected = false.obs;
  final timeIsSelected = false.obs;
  var currentDocIndex = 0.obs;

  DateTime lastDayOfMonth = DateTime.now();
  Rx<ApptFilterStatus> status = ApptFilterStatus.Upcoming.obs;
  Rx<Alignment> alignment = Alignment.centerLeft.obs;
  RxList<Appointment> allApptSchedules = <Appointment>[].obs;
  RxList<Appointment> filteredApptSchedules = <Appointment>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getappt();
    filteredApptSchedules =
        allApptSchedules.where((p) => p.status == 'Upcoming').toList().obs;
  }

  void getappt() async {
    
      var d = await FirebaseFirestore.instance
          .collection("userAppointment")
          .get()
          .then((value) => value.docs);
      d.forEach((ele) {
        allApptSchedules.add(Appointment(
          ele.data()['id'],
          ele.data()['docName'],
          ele.data()['docImage'],
          ele.data()['docSpecilization'],
          ele.data()['reservedDate'],
          ele.data()['reservedTime'],
          ele.data()['emergency'],
          ele.data()['docStatus'],
          ele.data()['status'],
        ));
      });
 
  }

  final List<String> timeslots = [
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM'
  ];

  reshudule(
    String id,
    String docName,
    String docImage,
    String Specilization,
  ) {
    final currentDate = lastDayOfMonth.add(Duration(days: indexDaytime.value));
    allApptSchedules.removeWhere((element) => element.id == id);
    final newAppoint = Appointment(
      Xid().toString(),
      docName,
      docImage,
      Specilization,
      DateFormat('E, MMM d').format(currentDate),
      timeslots[currentIndex.value],
      emergencyIsSelected.value,
      emergencyIsSelected.value,
      "Upcoming",
    );
    allApptSchedules.add(newAppoint);
    DaytimeArr[indexDaytime.value][currentIndex.value]
        .update('status', (value) => 'filled');
    Get.snackbar(
        "Booking Status", "Your Appointment has Succesfully Resheduled!");
  }

  datacal(int x) {
    final currentDate = lastDayOfMonth.add(Duration(days: x));
    return DateFormat('d').format(currentDate);
  }

  daynamecal(int x) {
    final currentDate = lastDayOfMonth.add(Duration(days: x));
    return DateFormat('E').format(currentDate);
  }

  filterCategory(ApptFilterStatus filterStatus) {
    filteredApptSchedules.assignAll(allApptSchedules.where((item) {
      return item.status == filterStatus.name.toString();
    }).toList());
    if (filterStatus == ApptFilterStatus.Upcoming) {
      status.value = ApptFilterStatus.Upcoming;
      alignment.value = Alignment.centerLeft;
    } else if (filterStatus == ApptFilterStatus.Complete) {
      status.value = ApptFilterStatus.Complete;
      alignment.value = Alignment.center;
    } else if (filterStatus == ApptFilterStatus.Cancel) {
      status.value = ApptFilterStatus.Cancel;
      alignment.value = Alignment.centerRight;
    }
    update();
    filteredApptSchedules.refresh();
  }

  void cancleBooking(String id) {
    allApptSchedules.removeWhere((element) => element.id == id);

    DaytimeArr[indexDaytime.value][currentIndex.value]
        .update('status', (value) => 'available');
    Get.snackbar("Booking Status", "Your Appointment has cancled!");
  }

  var monthyear = DateFormat('MMMM yyyy').format(DateTime.now());

  void changeDay(int selectedDayIndex) {
    indexDaytime.value = selectedDayIndex;
    DaytimeArr.refresh();
  }

  void reset() {
    DaytimeArr.forEach((elmt) {
      elmt.forEach((element) {
        if (element['status'] != 'filled') {
          element.update('status', (value) => 'available');
        }
      });
    });
  }

  void confirmBooking(
    String docName,
    String docImage,
    String Specilization,
  ) {
    var xid = Xid();
    final currentDate = lastDayOfMonth.add(Duration(days: indexDaytime.value));

    if (regularIsSelected == true) {
      for (int i = 0; i < 2; i++) {
        final currentDate =
            lastDayOfMonth.add(Duration(days: indexDaytime.value + i));
        DaytimeArr[indexDaytime.value + i][currentIndex.value]
            .update('status', (value) => 'filled');
        final newAppoint = Appointment(
          Xid().toString(),
          docName,
          docImage,
          Specilization,
          DateFormat('E, MMM d').format(currentDate),
          timeslots[currentIndex.value],
          emergencyIsSelected.value,
          emergencyIsSelected.value,
          "Upcoming",
        );
        allApptSchedules.add(newAppoint);
      }
      Get.snackbar(
          "Booking Status", "You have Succesfully Shedule a Regular Checkups");
    } else {
      DaytimeArr[indexDaytime.value][currentIndex.value]
          .update('status', (value) => 'filled');
      final newAppoint = Appointment(
        xid.toString(),
        docName,
        docImage,
        Specilization,
        DateFormat('E, MMM d').format(currentDate),
        timeslots[currentIndex.value],
        emergencyIsSelected.value,
        emergencyIsSelected.value,
        "Upcoming",
      );
      allApptSchedules.add(newAppoint);
      Get.snackbar("Booking Status", "You have Succesfully Booked a Slot");
    }
  }

  void selectdate(int selectedTimeIndex) {
    print(DaytimeArr[indexDaytime.value][selectedTimeIndex]);

    if (DaytimeArr[indexDaytime.value][selectedTimeIndex]['status'] ==
        'available') {
      reset();
      DaytimeArr[indexDaytime.value][selectedTimeIndex]
          .update('status', (value) => 'selected');
    }

    DaytimeArr.refresh();
  }

  var DaytimeArr = List.generate(
    6,
    (indexG) => List<Map<String, dynamic>>.generate(
      9,
      (indexK) {
        return {
          "id": "ID-${indexG + 1}-${indexK + 1}",
          "status": "available",
        };
      },
    ),
  ).obs;
}
