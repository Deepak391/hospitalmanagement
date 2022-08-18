import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/admin%20section/Controllers/MRDController.dart';
import 'package:myapp/models/medicine.dart';

class RequestCard extends GetView<MRDController> {
  String id;
  List<dynamic> medicines;
  String status;
  String patientName;
  List<dynamic> quantityArr;
  int total;

  RequestCard({
    Key? key,
    required this.id,
    required this.medicines,
    required this.status,
    required this.patientName,
    required this.quantityArr,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        borderOnForeground: true,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Patient name : $patientName",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    status.substring(0, 1).toUpperCase() + status.substring(1),
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                "Medicines : ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...medicines
                  .asMap()
                  .entries
                  .map(
                    (e) => ListTile(
                      leading: SizedBox(
                        child: FittedBox(
                          child: Image.network(e.value.image),
                          fit: BoxFit.contain,
                        ),
                        width: 100,
                        height: 100,
                      ),
                      title: Text(e.value.name),
                      subtitle: Text("\$${e.value.price}"),
                      trailing: Text("Quantity : ${quantityArr[e.key]}"),
                    ),
                  )
                  .toList(),
              Divider(),
              Row(
                children: [
                  Text("Total Price : \$${total}"),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        controller.acceptMedReq(medicines, id, quantityArr);
                      },
                      child: const Text("Accept")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
