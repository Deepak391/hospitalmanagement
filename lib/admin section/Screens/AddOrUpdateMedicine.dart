import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/admin%20section/Controllers/addUpdateController.dart';

class AddOrUpdateMedicine extends GetView<AddUpdateController> {
  static final routeName = "/addupdate";
  const AddOrUpdateMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add or Update Medicine"),
      ),
      body: Form(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const FittedBox(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.imageUrl,
                    initialValue: "",
                    decoration: const InputDecoration(label: Text("Image URL")),
                  ),
                )
              ],
            ),
            TextFormField(
              initialValue: "",
              controller: controller.name,
              decoration: const InputDecoration(label: Text("Name")),
            ),
            TextFormField(
              initialValue: "",
              maxLines: 3,
              controller: controller.description,
              decoration: const InputDecoration(
                label: Text("Description"),
              ),
            ),
            TextFormField(
              initialValue: "",
              controller: controller.price,
              decoration: const InputDecoration(
                label: Text("Price"),
              ),
            ),
            TextFormField(
              initialValue: "",
              controller: controller.category,
              decoration: const InputDecoration(
                label: Text("Category"),
              ),
            ),
            TextFormField(
              initialValue: "",
              controller: controller.type,
              decoration: const InputDecoration(
                label: Text("Type"),
              ),
            ),
            TextFormField(
              initialValue: "",
              controller: controller.qunatity,
              decoration: const InputDecoration(
                label: Text("Quantity"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text("Add Medicine"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
