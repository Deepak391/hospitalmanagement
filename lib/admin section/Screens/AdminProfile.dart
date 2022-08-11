import 'package:flutter/material.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
    );
  }
}
