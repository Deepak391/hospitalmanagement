import 'package:flutter/material.dart';
import 'package:myapp/admin%20section/Widgets/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Admin Home"),
      ),
    );
  }
}
