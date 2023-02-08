import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  String stdName = "";
  void save() {
    FirebaseFirestore.instance.collection("Student").add({"Name": stdName});
    Navigator.of(context).pushReplacementNamed("list");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Hero(
            tag: "logo",
            child: Container(
              padding: EdgeInsets.all(9),
              child: Image.asset("images/logo.jfif"),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        TextField(
          onChanged: (value) {
            setState(() {
              stdName = value;
            });
          },
        ),
        TextButton(onPressed: save, child: Text("Save"))
      ]),
    );
  }
}
