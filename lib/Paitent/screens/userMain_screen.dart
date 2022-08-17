import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/userAppt_controller.dart';
import '../widget/userSearch_bar.dart';
import '../widget/userdoctor_card.dart';
import '../controller/user_controller.dart';
import '../Model/userdoctor_model.dart';


final UserController controller = Get.put(UserController());
final ApptController controller1 = Get.put(ApptController());

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFdfe4ea),
      body: Obx(() => controller.isLoading == true ? Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Find Your Desired\nDoctor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SearchBar(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: GetBuilder(
                    builder: (UserController controller) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: DoctorSpecilization.categories.length,
                        itemBuilder: (_, index) {
                          DoctorSpecilization category =
                              DoctorSpecilization.categories[index];
                          return GestureDetector(
                            onTap: () {
                              controller.filterItemByCategory(category);
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: category.isSelected
                                    ? Color(0xffEF716B)
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                category.type.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                              padding: EdgeInsets.only(right: 15));
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GetBuilder(
                builder: (UserController controller) {
                  return DoctorCard(doctors: controller.filteredDoctors);
                },
              )
            ],
          ),
        ),
      ),)   
    );
  }
}
