import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/Paitent/Model/user_model.dart';
import '../controller/user_controller.dart';
import '../widget/UserProfile_card.dart';

final UserController controller = Get.put(UserController());

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User cuser = controller.currentUser;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              'Patient Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff151a56),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile2.png"),
                  ),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          primary: Colors.white,
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          print("Clicked");
                        },
                        child: SvgPicture.asset(
                          "assets/icons/Camera Icon.svg",
                          color: Colors.grey,
                        ),
                        // child: Icon(
                        //   Icons.add_a_photo,
                        //   color: Colors.grey,
                        // )
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            ProfileCard(
                icon: 'assets/icons/User.svg',
                title: 'Name: ',
                text: cuser.name),
            ProfileCard(
                icon: 'assets/icons/User.svg',
                title: 'Email: ',
                text: cuser.name),
            ProfileCard(
                icon: 'assets/icons/User.svg',
                title: 'Phone: ',
                text: cuser.phNum),
            ProfileCard(
                icon: 'assets/icons/User.svg',
                title: 'UserID: ',
                text: cuser.userId),
            ProfileCard(
                icon: 'assets/icons/User.svg', title: 'Sex: ', text: cuser.sex),
            ProfileCard(
                icon: 'assets/icons/User.svg',
                title: 'Age: ',
                text: cuser.age.toString()),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 60),
              height: 50,
              width: 450,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.red[400],
                ),
                onPressed: () {
                  print("Logout");
                },
                child: Row(
                  children: [Icon(Icons.logout), Text("Logout")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
