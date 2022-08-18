import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/admin%20section/Controllers/addPatientController.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

class AddPatient extends GetView<AddPatientController> {
  static final routeName = "/addPatient";
  const AddPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Add Patient"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          // onTap: () {
          //   FocusManager.instance.primaryFocus!.unfocus();
          // },
          child: Form(
            key: controller.gkey,
            child: Obx(
              () => ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.imgS == false
                          ? const CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Color.fromARGB(137, 239, 138, 138),
                              backgroundImage: null,
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(
                                controller.img,
                              ),
                            ),
                      TextButton(
                          onPressed: () {
                            controller.getImage();
                          },
                          child: const Text("Add Image")),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter name.";
                      }
                      if (value != null && value.isEmpty) {
                        return "Please enter name.";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.ageController,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter age.";
                      }
                      if (value != null && value.isEmpty) {
                        return "Please enter age.";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Age",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.genderController,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter Sex.";
                      }
                      if (value != null && value.isEmpty) {
                        return "Please enter Sex.";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Sex",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter Email.";
                      }
                      if (value != null && value.isEmpty) {
                        return "Please enter Email.";
                      }

                      if (!GetUtils.isEmail(value)) {
                        return "Please write email in proper format";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.submit();
                    },
                    child: const Text("Add Patient"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
