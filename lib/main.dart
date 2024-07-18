import 'package:flutter/material.dart';
import 'package:project/res/appcolors.dart';
import 'package:project/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista Tales',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
