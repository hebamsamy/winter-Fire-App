import 'package:fire_app/Screens/ListScreen.dart';
import 'package:fire_app/Screens/ProfileScreen.dart';
import 'package:fire_app/Screens/RegisterScreen.dart';
import 'package:fire_app/Screens/addScreen.dart';
import 'package:fire_app/loader.dart';
import 'package:fire_app/Screens/updateScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/WelComeScreen.dart';
import 'Screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, shot) {
            if (shot.connectionState == ConnectionState.done) {
              return WelcomeScreen();
            } else {
              return LoaderWidget(color: Colors.white);
            }
          }),
      routes: {
        "add": (context) => AddStudentScreen(),
        "list": (context) => StudentListScren(),
        "update": (context) => UpdateStudentScreen(),
        "login": (context) => LoginScreen(),
        "register": (context) => RegisterScreen(),
        "profile": (context) => ProfileScreen(),
      },
    );
  }
}
