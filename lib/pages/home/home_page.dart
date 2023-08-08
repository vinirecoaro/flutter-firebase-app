import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/shared/widgets/custon_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: CustonDrawer(),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(),
    ));
  }
}
