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

  // static Doctor fromSnapshot(DocumentSnapshot snap) {
  //   Doctor doctorlist = Doctor(
  //       name: snap['name'],
  //       image: snap['image'],
  //       description: snap["description"],
  //       specialization: snap["specialization"],
  //       type: snap["type"],
  //       docId: snap["docId"]);
  // }

  // static List<Doctor> doctorlist = [
  //   Doctor(
  //     "Dr. Stella Kane",
  //     "assets/images/doctor1.png",
  //     " Dr. Stella is the top most heart surgeon in Flower Hospital. She has done over 100 successful sugeries within past 3 years. She has achieved several awards for her wonderful contribution in her own field. She’s available for private consultation for given schedules.",
  //     "General Physician - Flower Hospital",
  //     "Pediatrician",
  //     "D001",
  //   ),
  //   Doctor(
  //     "Dr. Joseph Cart",
  //     "assets/images/doctor2.png",
  //     " Dr. Joseph Cart is the top most Eye Surgeon in Flower Hospital. She has done over 100 successful sugeries within past 3 years. She has achieved several awards for her wonderful contribution in her own field. She’s available for private consultation for given schedules.",
  //     "Eye Surgeon - Flower Hospitals",
  //     "Neurosurgeon",
  //     "D002",
  //   ),
  //   Doctor(
  //     "Dr. Stephanie",
  //     "assets/images/doctor3.png",
  //     " Dr. Stephanie is the top most Dental Surgeon in Flower Hospital. She has done over 100 successful sugeries within past 3 years. She has achieved several awards for her wonderful contribution in her own field. She’s available for private consultation for given schedules.",
  //     "Dental Surgeon - Flower Hospitals",
  //     "Cardiologist",
  //     "D003",
  //   ),
  //   Doctor(
  //     "Dr. David Kemp",
  //     "assets/images/doctor1.png",
  //     " Dr. David Kemp is the top most heart surgeon in Flower Hospital. She has done over 100 successful sugeries within past 3 years. She has achieved several awards for her wonderful contribution in her own field. She’s available for private consultation for given schedules.",
  //     "Heart Surgeon - Flower Hospitals",
  //     "Psychiatrist",
  //     "D004",
  //   ),
  // ];
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
