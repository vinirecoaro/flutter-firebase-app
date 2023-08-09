import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadHome();
  }

  loadHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    if (userId == null) {
      var uuid = const Uuid();
      userId = uuid.v4();
      prefs.setString("user_id", userId);
    }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
