import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/admin%20section/Controllers/SignUpController.dart';

class SignUpScreen extends GetView<SignUpController> {
  static final routeName = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SignUp Page"),
        ),
        body: Obx(
          () => controller.loading.value == true
              ? Center(
                  child: Lottie.asset('assets/loader.json'),
                )
              : SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 60, left: 16, right: 16),
                    width: context.width,
                    height: context.height,
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.signUpKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            DropdownButton<String>(
                              value: controller.dropdownValue.value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                controller.dropdownValue.value = newValue!;
                              },
                              items: <String>[
                                "Admin",
                                "Doctor",
                                "Patient"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const Text(
                              "Sign Up Page",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Obx(
                                    () => controller.imgSelected.value
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.black54,
                                            backgroundImage: FileImage(File(
                                                controller.filePath.value)),
                                          )
                                        : const CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.black54,
                                            backgroundImage: null,
                                          ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () => controller.getImage(),
                                    icon: const Icon(Icons.image),
                                    label: const Text("Add Image"),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Username",
                                prefixIcon: Icon(Icons.person),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.usernameController,
                              onSaved: (value) {
                                controller.username = value!;
                              },
                              validator: (value) {
                                return controller.validateUserName(value!);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                              onSaved: (value) {
                                controller.email = value!;
                              },
                              validator: (value) {
                                return controller.validateEmail(value!);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: controller.passwordController,
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Phone Number",
                                prefixIcon: Icon(Icons.phone_android),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.phoneController,
                              onSaved: (value) {
                                controller.phoneNumber = value!;
                              },
                              validator: (value) {
                                return controller.validatePhoneNumber(value!);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tightFor(width: context.width),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepPurpleAccent),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(14)),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.checkSignup();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed("/login");
                              },
                              child: const Text("Login"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
