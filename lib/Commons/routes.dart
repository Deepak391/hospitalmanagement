import 'package:get/route_manager.dart';
import 'package:myapp/Paitent/screens/userHome_screen.dart';
import 'package:myapp/admin%20section/Bindings/AddOrUpdateMedicineBinding.dart';
import 'package:myapp/admin%20section/Bindings/AddPatient.dart';
import 'package:myapp/admin%20section/Bindings/AdminHomeBinding.dart';
import 'package:myapp/admin%20section/Bindings/AppointmentBinding.dart';
import 'package:myapp/admin%20section/Bindings/LoginBinding.dart';
import 'package:myapp/admin%20section/Bindings/MedicineBinding.dart';
import 'package:myapp/admin%20section/Bindings/MrdBinding.dart';
import 'package:myapp/admin%20section/Bindings/SignupBinding.dart';
import 'package:myapp/admin%20section/Bindings/StoreBinding.dart';
import 'package:myapp/admin%20section/Bindings/restockBinding.dart';
import 'package:myapp/admin%20section/Controllers/RestockController.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddOrUpdateMedicine.dart';
import 'package:myapp/admin%20section/Screens/AddPatient.dart';
import 'package:myapp/admin%20section/Screens/AdminHomeScreen.dart';
import 'package:myapp/admin%20section/Screens/AppointmentLists.dart';
import 'package:myapp/admin%20section/Screens/LoginScreen.dart';
import 'package:myapp/admin%20section/Screens/Medicine%20Details.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequest.dart';
import 'package:myapp/admin%20section/Screens/MedicineRequestScreen.dart';
import 'package:myapp/admin%20section/Screens/RestockMedicine.dart';
import 'package:myapp/admin%20section/Screens/Singup.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';
import 'package:myapp/Commons/onboarding_screen.dart';
import 'package:myapp/doctor/Screens/doctor_home.dart';

var Routes = [
  GetPage(
    name: AdminHomeScreen.routeName,
    page: () => AdminHomeScreen(),
    binding: AdminHomeBinding(),
  ),
  GetPage(
    name: Store.routeName,
    page: () => Store(),
    binding: StoreBinding(),
  ),
  GetPage(
    name: MedicineDetail.routeName,
    page: () => MedicineDetail(),
    binding: MedicineBinding(),
  ),
  GetPage(
    name: AddOrUpdateMedicine.routeName,
    page: () => AddOrUpdateMedicine(),
    binding: AddOrUpdateBinding(),
  ),
  GetPage(
    name: AddPatient.routeName,
    page: () => AddPatient(),
    binding: AddPatientBinding(),
  ),
  GetPage(
    name: MedicineRequestScreen.routeName,
    page: () => MedicineRequestScreen(),
    binding: MrdBinding(),
  ),
  GetPage(
    name: RestockMedicine.routeName,
    page: () => RestockMedicine(),
    binding: RestockBinding(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: AppointmentList.routeName,
    page: () => AppointmentList(),
    binding: AppointmentBinding(),
  ),
  GetPage(
    name: onBoardingScreen.routeName,
    page: () => onBoardingScreen(),
    // binding: AppointmentBinding(),
  ),
  GetPage(
    name: UserHomeScreen.routeName,
    page: () => UserHomeScreen(),
  ),
  GetPage(
    name: DoctorHome.routeName,
    page: () => DoctorHome(),
  ),
];
