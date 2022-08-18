import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Paitent/screens/userApptBooking_screen.dart';
import '/Paitent/screens/userPrescription_screen.dart';
import '/Paitent/screens/userResheduleAppt_screen.dart';
import '../Model/userdoctor_model.dart';
import '../controller/userAppt_controller.dart';
import '../Model/userAppt_model.dart';
import '../widget/userDatetime_card.dart';

final ApptController controller = Get.put(ApptController());

class UserAppList extends StatelessWidget {
  const UserAppList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Scheduled Appointments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff151a56),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f3fe),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (ApptFilterStatus filterStatus
                                  in ApptFilterStatus.values)
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.filterCategory(filterStatus);
                                    },
                                    child: Center(
                                      child: Text(
                                        filterStatus.name,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        AnimatedAlign(
                          duration: Duration(milliseconds: 200),
                          alignment: controller.alignment.value,
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xffEF716B),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                controller.status.value.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GetBuilder(
                      builder: (ApptController controller) {
                        return ListView.builder(
                          itemCount: controller.filteredApptSchedules.length,
                          itemBuilder: (_, index) {
                            var schedule =
                                controller.filteredApptSchedules[index];

                            return Card(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(schedule.docImage),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              schedule.docName,
                                              style: TextStyle(
                                                color: Color(0xff151a56),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              schedule.docSpecilization,
                                              style: TextStyle(
                                                color: Color(0xff9796af),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        schedule.docStatus
                                            ? Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Confirmed",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff9796af),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : controller.status.value ==
                                                    ApptFilterStatus.Cancel
                                                ? Row(children: <Widget>[
                                                    Icon(
                                                      Icons.cancel,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "Cancled",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff9796af),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ])
                                                : Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.help,
                                                        color: Colors.amber,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Awaiting",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff9796af),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    DateTimeCard(
                                      sheduleApps: schedule,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    controller.status.value ==
                                            ApptFilterStatus.Complete
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  'Here is your Prescription :   ',
                                                  style: TextStyle(
                                                    color: Color(0xff9796af),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 120),
                                                child: MaterialButton(
                                                  color: Color(0xffEF716B),
                                                  child: Text(
                                                    '  Prescription  ',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () => {
                                                    Get.to(
                                                      () => userPrescription(
                                                          pdoc: schedule),
                                                    ),
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        : controller.status.value ==
                                                ApptFilterStatus.Cancel
                                            ? Center(
                                                child: Text(
                                                  "Your Appointment is Cancled!",
                                                  style: TextStyle(
                                                    color: Color(0xff151a56),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: OutlinedButton(
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff151a56),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                            .cancleBooking(
                                                                schedule.id);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: MaterialButton(
                                                      color: Color(0xffEF716B),
                                                      child: Text(
                                                        'Reschedule',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () => {
                                                        Get.to(
                                                          () => ApptReschedule(
                                                              id: schedule.id,
                                                              docimage: schedule
                                                                  .docImage,
                                                              docname: schedule
                                                                  .docName,
                                                              specialization:
                                                                  schedule
                                                                      .docSpecilization),
                                                        ),

                                                        // Get.to(() => ApptBooking(
                                                        //     doc: controller.reshedule(
                                                        //         schedule.docName,
                                                        //         schedule.id)))
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    ));
  }
}
