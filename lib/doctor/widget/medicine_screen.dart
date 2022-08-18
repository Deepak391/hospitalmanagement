import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/due_appointment_controller.dart';
import '../Models/doctor_appointment.dart';
import '../Models/medicine_list.dart';

class MedicineScreen extends StatelessWidget {
  final DueAppointmentController controller = Get.find();
  final Appointment appoint;
  MedicineScreen({required this.appoint, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.allmedicine.length,
        itemBuilder: (BuildContext ctx, index) {
          return MedicineScreenCard(
            index: index,
            appoint: appoint,
          );
        });
  }
}

class MedicineScreenCard extends StatelessWidget {
  final int index;
  final Appointment appoint;
  final DueAppointmentController controller = Get.find();
  MedicineScreenCard({required this.index, required this.appoint, super.key});
  TextEditingController temptext = TextEditingController();
  TextEditingController quan = TextEditingController();
  // String as;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: Card(
            elevation: 10,
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Medicine Name : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            controller.allmedicine[index].name,
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
                            'Quantity : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            controller.allmedicine[index].quantity.toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Enter Quantity"),
                        controller: quan,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Direction to use"),
                        controller: temptext,
                      ),
                      RaisedButton(
                        child: const Text("Add in Prescription"),
                        onPressed: () {
                          int s = int.parse(quan.text);
                          controller.addmedicine(
                              controller.allmedicine[index], s, temptext.text);
                        },
                      ),
                    ]))));
  }
}
