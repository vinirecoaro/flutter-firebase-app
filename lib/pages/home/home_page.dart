import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/shared/widgets/custon_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(int.parse(
          "0xff${remoteConfig.getString("BACKGROUND_SCREEN_COLOR")}")),
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: TextButton(
          onPressed: () => throw Exception(),
          child: const Text("Throw Test Exception"),
        ),
      ),
    ));
  }
}
