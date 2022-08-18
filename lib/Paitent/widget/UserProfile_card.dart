import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  String title;
  String text;
  String icon;
  ProfileCard(
      {Key? key, required this.icon, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60, bottom: 20),
      height: 60,
      width: 460,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        elevation: 0,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Image.asset(icon, height: 25, width: 25,),
            Text(
              "     ${title} ",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
