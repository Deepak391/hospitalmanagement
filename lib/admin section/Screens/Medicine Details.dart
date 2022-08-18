import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/MedicineDetailsController.dart';

class MedicineDetail extends GetView<MedicineDetailController> {
  static final routeName = "/medicinedetail";
  MedicineDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: controller.obx(
          (state) => Container(
            // decoration: const BoxDecoration(
            //   border: Border(
            //     top: BorderSide(
            //       color: Colors.black,
            //       width: 1,
            //     ),
            //   ),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          state.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.network(state.image),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Price :",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "\$${state.price.toString()}",
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Quantity :",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Obx(() => Text(
                                  "${controller.medicineQuantity.value}",
                                  style: const TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          state.description,
                          softWrap: true,
                          style: const TextStyle(fontFamily: "Quicksand"),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            BottomSheet(
                              onClosing: () {
                                print("Executing");
                                controller.increaseMedicineQunatity();
                              },
                              builder: (context) => Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                height: 200,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Obx(
                                          () => Text(
                                            "${controller.medicineQuantity.value}",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.incraseQuantity();
                                          },
                                          child: const Text("+10"),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        print("Exe");
                                        controller.increaseMedicineQunatity();
                                      },
                                      child: const Text("Increase"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // isDismissible: false,
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Update Quantity"),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          onError: (error) => Container(
            padding: const EdgeInsets.all(10),
            child: Text(error.toString()),
          ),
          onLoading: Center(
            child: Lottie.asset('assets/loader.json'),
          ),
        ),
      ),
    );
  }
}
