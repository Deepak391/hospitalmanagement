import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/MedicineDetailsController.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddOrUpdateMedicine.dart';

enum FilerOptions { update, delete }

class MediicineItem extends StatelessWidget {
  StoreController sc = Get.find<StoreController>();

  String id;
  String image;
  String name;
  String type;
  int price;
  int quantity;
  String description;

  MediicineItem({
    Key? key,
    required this.id,
    required this.image,
    required this.description,
    required this.name,
    required this.price,
    required this.quantity,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Get.toNamed("/medicinedetail", parameters: {"id": id});
          },
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: FittedBox(
                    child: Image.network(image),
                  ),
                ),
                title: Text(name),
                subtitle: Text("\$$price"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Qunatity : $quantity"),
                    PopupMenuButton(
                      onSelected: (FilerOptions val) {
                        if (val == FilerOptions.update) {
                          print("Updating Medicine.");
                          Get.toNamed(AddOrUpdateMedicine.routeName,
                              parameters: {"id": id});
                        } else {
                          print("Deleting Medicine.");
                          sc.delete(id);
                        }
                      },
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (_) => [
                        const PopupMenuItem(
                          value: FilerOptions.update,
                          child: Text("Update"),
                        ),
                        const PopupMenuItem(
                          value: FilerOptions.delete,
                          child: Text("Delete"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              if (quantity < 10)
                Column(
                  children: const [
                    Divider(),
                    Text(
                      "Restock needed !!!",
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
