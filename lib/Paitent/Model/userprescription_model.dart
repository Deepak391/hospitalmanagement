class Prescription {
  String id;
  String name;
  String image;
  String useage;

  Prescription(
    this.id,
    this.name,
    this.image,
    this.useage,
  );
  static List<Prescription> Prescriptionlist = [
    Prescription(
      "P001",
      "Parecetamol",
      "assets/images/medicine1.png",
      "Twice a day",
    ),
    Prescription(
      "P002",
      "Parecetamol2",
      "assets/images/medicine1.png",
      "Twice a day",
    ),
    Prescription(
      "P003",
      "Parecetamol3",
      "assets/images/medicine1.png",
      "Twice a day",
    ),
  ];
}
