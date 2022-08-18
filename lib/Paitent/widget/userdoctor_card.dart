import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Paitent/Model/userdoctor_model.dart';
import '../controller/userDoc_controller.dart';
import '../screens/userDoctor_detail.dart';
import '../Model/userdoctor_model.dart';

final UserController controller = Get.put(UserController());

class DoctorCard extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorCard({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (_, index) {
          Doctor doc = doctors[index];
          return Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Get.to(() => userDoctorDetails(
                      doc: doc,
                    ));
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.network(doc.image),
                    title: Text(
                      doc.name,
                      style: const TextStyle(
                        color: Color(0xff1E1C61),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      doc.specialization,
                      style: TextStyle(
                        color: Color(0xff1E1C61).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
