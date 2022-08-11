import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediicineItem extends StatelessWidget {
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
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Get.toNamed("/medicinedetail", parameters: {"id": id});
        },
        child: ListTile(
          leading: SizedBox(
            width: 100,
            height: 100,
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
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    child: Text("Update"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
