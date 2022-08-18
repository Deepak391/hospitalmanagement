import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/Commons/routes.dart';
import 'package:myapp/Paitent/screens/userHome_screen.dart';
import 'package:myapp/admin%20section/Bindings/AdminHomeBinding.dart';
import 'package:myapp/admin%20section/Bindings/LoginBinding.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddPatient.dart';
import 'package:myapp/admin%20section/Screens/AdminHomeScreen.dart';
import 'package:myapp/admin%20section/Screens/AppointmentLists.dart';
import 'package:myapp/admin%20section/Screens/LoginScreen.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequestScreen.dart';
import 'package:myapp/admin%20section/Screens/Singup.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';
import 'package:myapp/doctor/Screens/doctor_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GetStorage getSt = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? getSt.read("role") == "Admin"
              ? AdminHomeScreen.routeName
              : (getSt.read("role") == "Doctor"
                  ? UserHomeScreen.routeName
                  : DoctorHome.routeName)
          : LoginScreen.routeName,
      initialBinding: FirebaseAuth.instance.currentUser != null
          ? getSt.read("role") == "Admin"
              ? AdminHomeBinding()
              : null
          : null,
      // home: AdminHomeScreen(),
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
