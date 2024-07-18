import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/res/images.dart';
import 'package:project/res/appcolors.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LoginScreen(),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      body: Center(
        child: Image.asset(
          Images.splashImage,
          fit: BoxFit.contain,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
