enum Docspecialization {
  All,
  Pediatrician,
  Neurosurgeon,
  Cardiologist,
  Psychiatrist
}

class Doctor {
  String name;
  String image;
  String description;
  String specialization;
  String type;
  String docId;

  Doctor(
    this.name,
    this.image,
    this.description,
    this.specialization,
    this.type,
    this.docId,
  );
}

class DoctorSpecilization {
  final Docspecialization type;
  bool isSelected;

  DoctorSpecilization(this.type, this.isSelected);

  static List<DoctorSpecilization> categories = [
    DoctorSpecilization(Docspecialization.All, true),
    DoctorSpecilization(Docspecialization.Pediatrician, false),
    DoctorSpecilization(Docspecialization.Psychiatrist, false),
    DoctorSpecilization(Docspecialization.Cardiologist, false),
    DoctorSpecilization(Docspecialization.Neurosurgeon, false),
  ];
}
