import 'package:flutter/material.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Add Patient"),
      ),
    );
  }
}
