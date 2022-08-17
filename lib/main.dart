import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Commons/routes.dart';
import 'package:myapp/admin%20section/Bindings/AdminHomeBinding.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddPatient.dart';
import 'package:myapp/admin%20section/Screens/AdminHomeScreen.dart';
import 'package:myapp/admin%20section/Screens/AppointmentLists.dart';
import 'package:myapp/admin%20section/Screens/LoginScreen.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequestScreen.dart';
import 'package:myapp/admin%20section/Screens/Singup.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppointmentList.routeName,
      initialBinding: AdminHomeBinding(),
      home: AdminHomeScreen(),
      getPages: Routes,
      theme: ThemeData(
        fontFamily: "Quicksand",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
