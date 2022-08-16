import 'package:hospital_management_system/doctor/Models/medicine.dart';

class MedicineStock {
  String name;
  int Quantity;
  MedicineStock({this.name = "", this.Quantity = 0});

 static List<MedicineStock> medicinelist = [
    MedicineStock(name: "Paracetamol",Quantity: 10),
    MedicineStock(name: "acarbose",Quantity: 10),
    MedicineStock(name: "Accupril",Quantity: 10),
    MedicineStock(name: "Accupril",Quantity: 10),
    MedicineStock(name: "Aceon",Quantity: 10),
    MedicineStock(name: "Acephen",Quantity: 10),
    MedicineStock(name: "acetaminophen",Quantity: 10),
    MedicineStock(name: "acetylcysteine",Quantity: 10),
    MedicineStock(name: "Aciphex",Quantity: 10),
    MedicineStock(name: "Actonel",Quantity: 10),
    MedicineStock(name: "Actos",Quantity: 10),
    MedicineStock(name: "adapalene",Quantity: 10),
  ];
}
