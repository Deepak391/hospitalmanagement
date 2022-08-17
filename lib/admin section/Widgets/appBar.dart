import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';

class appbar extends StatelessWidget {
  String Title;
  appbar({Key? key, required this.Title}) : super(key: key);

  var restockLen = Get.find<RestockController>().RestockLength;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Title),
      actions: [
        Obx(
          () => Stack(
            children: [
              Text(restockLen),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            ],
          ),
        ),
      ],
    );
  }
}
