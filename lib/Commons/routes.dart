import 'package:get/route_manager.dart';
import 'package:myapp/admin%20section/Bindings/AdminHomeBinding.dart';
import 'package:myapp/admin%20section/Bindings/MedicineBinding.dart';
import 'package:myapp/admin%20section/Bindings/StoreBinding.dart';
import 'package:myapp/admin%20section/Controllers/StoreController.dart';
import 'package:myapp/admin%20section/Screens/AddOrUpdateMedicine.dart';
import 'package:myapp/admin%20section/Screens/AdminHomeScreen.dart';
import 'package:myapp/admin%20section/Screens/Medicine%20Details.dart';
import 'package:myapp/admin%20section/Screens/Store.dart';

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
    binding: MedicineBinding(),
  ),
];
