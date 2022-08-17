import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/userAppt_model.dart';
import '../controller/userAppt_controller.dart';

//final ApptController controller = Get.put(ApptController());

class DateTimeCard extends StatelessWidget {
  Appointment sheduleApps;
  DateTimeCard({Key? key, required this.sheduleApps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe8eafe),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(0xff575de3),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                sheduleApps.reservedDate,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff575de3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(0xff575de3),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                sheduleApps.reservedTime,
                style: TextStyle(
                  color: Color(0xff575de3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
