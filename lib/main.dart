import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Commons/routes.dart';
import 'package:myapp/admin%20section/Screens/AdminHomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHomeScreen(),
      getPages: Routes,
    );
  }
}
