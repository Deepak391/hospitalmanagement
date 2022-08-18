import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import '../Paitent/screens/userHome_screen.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/onboarding_images%2Fonboard1.png?alt=media&token=8bbe4943-299b-481a-a943-92bf97450c69"),
        title: "Lost how to manage everything in Hospital?",
        body:
            "Our app provide all in one solution for every problem that you can face We got every thing for you in single app from booking appointment to manage appointment we got everything paitent flow to admin flow and even doctor flow as well!  ",
        footer: Text("created by ❤️ Team3x"),
      ),
      PageViewModel(
        image: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/onboarding_images%2Fonboard3.png?alt=media&token=830644fe-a502-40e8-92b4-50aafc509807"),
        title: "Very Easy UI for Paitent!",
        body:
            "In our app paitent can choose any doctor and can book or shedule a regular appointment with him and its not enough ? we got you here paitent can see all the booked appointment and can manage them and can order all prescribed mediciens to from our own pharmacy in cheap Price!",
      ),
      PageViewModel(
        image: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/onboarding_images%2Fonboard2.png?alt=media&token=649d1b5f-7dcd-4bc8-8fe3-3284f0d41a2b"),
        title: "We got everything for doctor!",
        body:
            "In our app doctor can accept appointments, manage all appointment keep every data of paitent and even can provide precreption when the appointment is completed",
      ),
      PageViewModel(
        image: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/onboarding_images%2Fonboard2.png?alt=media&token=649d1b5f-7dcd-4bc8-8fe3-3284f0d41a2b"),
        title: "We got full Admin control!",
        body:
            "In our app Admin has multiple functionality , he manage all kinds of medicines what we got in our pharmacy stock, all add new meds, restock them and comnfirm the order from the paitent side and its not enough he can manage every thing from adding paitent to adding doctors and manage everything",
      ),
      PageViewModel(
        image: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/hospital-management-syst-e9b60.appspot.com/o/onboarding_images%2Fistockphoto-1317983119-612x612.jpg?alt=media&token=83bd486b-1f84-40eb-ac1d-c10ac5467446"),
        title: "Why you are still thinking?",
        body:
            "Register now and choose your role what you want to be , paitent , doctor or  admin!",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: Text(
        'Done',
        style: TextStyle(color: Colors.black),
      ),
      onDone: () {
        Get.to(() => UserHomeScreen());
      },
      pages: getPages(),
      globalBackgroundColor: Colors.white,
      showBackButton: false,
      next: const Icon(Icons.navigate_next),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
