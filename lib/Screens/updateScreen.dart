import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateStudentScreen extends StatefulWidget {
  const UpdateStudentScreen({super.key});

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  String stdName = "";
  String selectdID = "";
  void save() {
    FirebaseFirestore.instance
        .collection("Student")
        .doc(selectdID)
        .update({"Name": stdName});
    Navigator.of(context).pushReplacementNamed("list");
  }

  @override
  Widget build(BuildContext context) {
    selectdID = ModalRoute.of(context)?.settings.arguments as String;
    print(selectdID);
    FirebaseFirestore.instance.collection("Student").doc(selectdID).get().then(
      (value) {
        print(value["Name"]);
        // setState(() {
        //   this.stdName = value["Name"];
        // });
      },
    );
    return Scaffold(
      appBar: AppBar(),
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
