import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/due_appointment_controller.dart';
import 'package:intl/intl.dart';
class DueAppointment extends StatelessWidget {
  final DueAppointmentController controller = Get.find();

  DueAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: controller.dueappoint.length,
          itemBuilder: (BuildContext ctx, index) {
            return DueAppointmentCard(
                index: index,
                controller: controller,
                );
          }),
    );
  }
}

class DueAppointmentCard extends StatelessWidget {
  final int index;
  final DueAppointmentController controller;
  const DueAppointmentCard(
      {required this.index, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.dueappoint[index].patient_name,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AGE : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.dueappoint[index].patient_age.toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SEX : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        controller.dueappoint[index].patient_gender,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date : ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text('${DateFormat.MMMEd().format(controller.dueappoint[index].date_time)} ${DateFormat.jm().format(controller.dueappoint[index].date_time)}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                ElevatedButton(
                        child:const Text('Reshedule'),
                        onPressed: () {},
                      ),
                const SizedBox(width: 40),
                ElevatedButton(
                        child: const Text('Accept'),
                        onPressed: () =>{controller.acceptappointment(controller.dueappoint[index])},
                      ),
                const SizedBox(width: 40),
                TextButton(
                    onPressed: () => {},
                    child: const Text('Emergency',
                        style: TextStyle(
                          color: Colors.red,
                        ))),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
