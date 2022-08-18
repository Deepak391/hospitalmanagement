import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Paitent/Model/user_model.dart';
import '../Model/userAppt_model.dart';
import 'package:flutter/material.dart';
import 'package:xid/xid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApptController extends GetxController {
  var isLoading = false.obs;
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
  RxList<Appointment> nullsch = <Appointment>[].obs;
  RxList<Appointment> filteredApptSchedules = <Appointment>[].obs;
  RxList<User> alluser = <User>[].obs;
  User currentUser = User.Userlist[0];

  static int currentUserIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getappt();
    //getuser();
  }

  // void getuser() async {
  //   isLoading.value = true;
  //   var d = await FirebaseFirestore.instance
  //       .collection("userPatient")
  //       .get()
  //       .then((value) => value.docs);
  //   d.forEach((ele) {
  //     alluser.add(User(
  //         ele.data()['name'],
  //         ele.data()['email'],
  //         ele.data()['image'],
  //         ele.data()['age'],
  //         ele.data()['sex'],
  //         ele.data()['userId'],
  //         ele.data()['phNum']));
  //   });
  //   RxList<User> currentUser =
  //       alluser.where((p0) => p0.userId == "P001").toList().obs;
  //   print(currentUser[0]);
  //   isLoading.value = false;
  // }

  void getappt() async {
    isLoading.value = true;
    allApptSchedules([]);

    var d = await FirebaseFirestore.instance
        .collection("appointmentList")
        .get()
        .then((value) => value.docs);
    d.forEach((ele) {
      allApptSchedules.add(Appointment(
        ele.id,
        ele.data()['docName'],
        ele.data()['docId'],
        ele.data()['docImage'],
        ele.data()['docSpecilization'],
        ele.data()['patient_name'],
        ele.data()['patient_age'],
        ele.data()['patient_gender'],
        ele.data()['gmeet'],
        ele.data()['reshedule'],
        ele.data()['Done'],
        ele.data()['prescription'],
        ele.data()['med'],
        ele.data()['reservedDate'],
        ele.data()['reservedTime'],
        ele.data()['emergency'],
        ele.data()['docStatus'],
        ele.data()['status'],
        ele.data()['date_time'],
      ));
    });
    filteredApptSchedules =
        allApptSchedules.where((p) => p.status == 'Upcoming').toList().obs;
    isLoading.value = false;
  }

  final List<String> timeslots = [
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM'
  ];

  reshudule(
    String id,
    String docName,
    String docImage,
    String Specilization,
  ) async {
    int t = int.parse(timeslots[currentIndex.value].substring(0, 2));
    final pastime = DateTime(lastDayOfMonth.year, lastDayOfMonth.month,
        lastDayOfMonth.day + indexDaytime.value, t);
    final currentDate = lastDayOfMonth.add(Duration(days: indexDaytime.value));

    await FirebaseFirestore.instance
        .collection("appointmentList")
        .doc(id)
        .update({
      "reservedDate": DateFormat('E, MMM d').format(currentDate),
      "reservedTime": timeslots[currentIndex.value],
      "date_time": pastime,
    });
    getappt();
    DaytimeArr[indexDaytime.value][currentIndex.value]
        .update('status', (value) => 'filled');
    Get.snackbar(
        "Booking Status", "Your Appointment has Succesfully Resheduled!");
  }

  void cancleBooking(String id) async {
    await FirebaseFirestore.instance
        .collection("appointmentList")
        .doc(id)
        .update({"status": "Cancel", "docStatus": false, "emergency": false});
    getappt();
    DaytimeArr[indexDaytime.value][currentIndex.value]
        .update('status', (value) => 'available');
    Get.snackbar("Booking Status", "Your Appointment has cancled!");
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
    String docId,
    String docImage,
    String Specilization,
  ) async {
    var xid = Xid();
    int t = int.parse(timeslots[currentIndex.value].substring(0, 2));

    final pastime = DateTime(lastDayOfMonth.year, lastDayOfMonth.month,
        lastDayOfMonth.day + indexDaytime.value, t);

    final currentDate = lastDayOfMonth.add(Duration(days: indexDaytime.value));
    final docuser =
        FirebaseFirestore.instance.collection('appointmentList').doc();

    if (regularIsSelected == true) {
      for (int i = 0; i < 2; i++) {
        final currentDate =
            lastDayOfMonth.add(Duration(days: indexDaytime.value + i));
        DaytimeArr[indexDaytime.value + i][currentIndex.value]
            .update('status', (value) => 'filled');
        await FirebaseFirestore.instance
            .collection("appointmentList")
            .doc(docuser.id)
            .set({
          'id': docuser.id,
          'docName': docName,
          'docImage': docImage,
          'docSpecilization': Specilization,
          'patient_name': currentUser.name,
          'patient_age': currentUser.age,
          'patient_gender': currentUser.sex,
          'reservedDate': DateFormat('E, MMM d').format(currentDate),
          'reservedTime': timeslots[currentIndex.value],
          'emergency': emergencyIsSelected.value,
          'docStatus': emergencyIsSelected.value,
          'status': "Upcoming",
          'gmeet': "",
          'reshedule': false,
          'Done': false,
          'prescription': "",
          'med': [],
          'docId': docId,
          'date_time': pastime,
        });
      }
      Get.snackbar(
          "Booking Status", "You have Succesfully Shedule a Regular Checkups");
    } else {
      DaytimeArr[indexDaytime.value][currentIndex.value]
          .update('status', (value) => 'filled');
      await FirebaseFirestore.instance
          .collection("appointmentList")
          .doc(docuser.id)
          .set({
        'id': docuser.id,
        'docName': docName,
        'docImage': docImage,
        'docSpecilization': Specilization,
        'patient_name': currentUser.name,
        'patient_age': currentUser.age,
        'patient_gender': currentUser.sex,
        'reservedDate': DateFormat('E, MMM d').format(currentDate),
        'reservedTime': timeslots[currentIndex.value],
        'emergency': emergencyIsSelected.value,
        'docStatus': emergencyIsSelected.value,
        'status': "Upcoming",
        'gmeet': "",
        'reshedule': false,
        'Done': false,
        'prescription': "",
        'med': [],
        'docId': docId,
        'date_time': pastime,
      });
      Get.snackbar("Booking Status", "You have Succesfully Booked a Slot");
    }
    filteredApptSchedules.assignAll(nullsch);
    getappt();
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
