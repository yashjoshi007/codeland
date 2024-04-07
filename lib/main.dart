import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:codeland/screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAb8GxVybSPZqx1zVZj9QGSTidjevnq20U",
        appId: "1:277590019202:android:542977b7e8a2384c2ff89b",
        messagingSenderId: "277590019202",
        projectId: "codeland-1a18a",
        storageBucket: "codeland-1a18a.appspot.com",

      ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Land',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(nextScreen: LoginPage()),
    );
  }
}

class SplashScreen extends StatelessWidget {
  final Widget nextScreen;

  const SplashScreen({required this.nextScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    });

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          width: 300, // Adjust width according to your requirement
          height: 300, // Adjust height according to your requirement
        ),
      ),
    );
  }
}
