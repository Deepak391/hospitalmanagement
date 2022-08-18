import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final username =
        getStorage.read("username") != null ? getStorage.read("username") : "";
    final email = getStorage.read("email");
    final phoneNumber = getStorage.read("phoneNumber");
    final address = getStorage.read("image");

    final List<Color> circleColors = [Colors.red, Colors.blue, Colors.green];
    final List<Color> newcircleColors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent
    ];
    // Color randomGenerator() {
    //   return circleColors[new Random().nextInt(2)];
    // }

    // Color randomGeneratorTwo() {
    //   return newcircleColors[new Random().nextInt(2)];
    // }

    String imgText =
        username != "" ? username.substring(0, 2).toUpperCase() : "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.toNamed("/profile");
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black54,
                      backgroundImage: NetworkImage(
                        getStorage.read("image"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(username),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Email : ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${email}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Phone Number : ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${phoneNumber}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
