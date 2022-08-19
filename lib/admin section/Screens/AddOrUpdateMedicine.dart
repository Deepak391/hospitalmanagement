import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
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
      body: Obx(
        () => controller.isLoading.value == false
            ? Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: controller.key,
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
                            child: controller.imageUrl.value == ""
                                ? Container()
                                : FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.network(
                                        controller.imageUrl.value),
                                  ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (val) {
                                controller.checkUrl(val);
                              },
                              controller: controller.imageUrlController,
                              decoration: const InputDecoration(
                                  label: Text("Image URL")),
                              validator: (value) {
                                if (value == null &&
                                    (value != null && value.isEmpty)) {
                                  return "Please provide a valid Value";
                                }

                                if (value != null) {
                                  if (!value.startsWith("http") &&
                                      !value.startsWith("https")) {
                                    return "Please provide valid URL";
                                  }

                                  if (value.endsWith("jpg")) {
                                  } else if (value.endsWith("png")) {
                                  } else if (value.endsWith("jpeg")) {
                                  } else {
                                    return "Please provide valid image type";
                                  }
                                }

                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: controller.nameController,
                        decoration: const InputDecoration(label: Text("Name")),
                        validator: (value) {
                          if (value == null &&
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Name.";
                          }
                          if (value!.length < 4) {
                            return "Please provide description greater than 10";
                          }
                        },
                      ),
                      TextFormField(
                        maxLines: 3,
                        controller: controller.descriptionController,
                        decoration: const InputDecoration(
                          label: Text("Description"),
                        ),
                        validator: (value) {
                          if (value == null ||
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Description.";
                          }

                          if (value.length < 10) {
                            return "Please provide description greater than 10";
                          }
                        },
                      ),
                      TextFormField(
                        controller: controller.priceController,
                        decoration: const InputDecoration(
                          label: Text("Price"),
                        ),
                        validator: (value) {
                          if (value == null ||
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Price.";
                          }
                          if (int.parse(value) <= 0) {
                            return "Please provide price greater than 0.";
                          }
                        },
                      ),
                      TextFormField(
                        controller: controller.categoryContreller,
                        decoration: const InputDecoration(
                          label: Text("Category"),
                        ),
                        validator: (value) {
                          if (value == null ||
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Category.";
                          }

                          if (value.length < 0 || value.length > 15) {
                            return "Please provide a valid Category.";
                          }
                        },
                      ),
                      TextFormField(
                        controller: controller.typeController,
                        decoration: const InputDecoration(
                          label: Text("Type"),
                        ),
                        validator: (value) {
                          if (value == null ||
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Type.";
                          }

                          if (value.length < 0 || value.length > 15) {
                            return "Please provide a valid Type.";
                          }
                        },
                      ),
                      TextFormField(
                        controller: controller.qunatityController,
                        decoration: const InputDecoration(
                          label: Text("Quantity"),
                        ),
                        validator: (value) {
                          if (value == null ||
                              (value != null && value.isEmpty)) {
                            return "Please provide a valid Quantity.";
                          }

                          if (int.parse(value) <= 0) {
                            return "Please provide a quantity > 10";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            controller.checkSignup();
                          },
                          child: Text(controller.buttonText.value),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Lottie.asset('assets/loader.json'),
              ),
      ),
    );
  }
}
