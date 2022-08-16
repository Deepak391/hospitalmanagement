import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/doctor/Controller/due_appointment_controller.dart';
import 'package:hospital_management_system/doctor/Models/doctor_appointment.dart';
import 'package:hospital_management_system/doctor/Models/medicine_list.dart';

class MedicineScreen extends StatelessWidget {
  final Appointment appoint;
  const MedicineScreen({required this.appoint, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: MedicineStock.medicinelist.length,
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
  // String as;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
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
                            MedicineStock.medicinelist[index].name,
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
                            MedicineStock.medicinelist[index].Quantity
                                .toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Direction to use"),
                        controller: temptext,
                      ),
                      RaisedButton(
                        child: const Text("Add in Prescription"),
                        onPressed: () {
                          // if (temptext.isNull) {
                          //   temptext = "No Suggestion" as TextEditingController;
                          // }
                          controller.addmedicine(
                              appoint,
                              MedicineStock.medicinelist[index].name,
                              temptext.text);
                        },
                      ),
                    ]))));
  }
}
