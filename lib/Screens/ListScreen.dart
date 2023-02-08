import 'package:fire_app/loader.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentListScren extends StatefulWidget {
  const StudentListScren({super.key});

  @override
  State<StudentListScren> createState() => _StudentListScrenState();
}

class _StudentListScrenState extends State<StudentListScren> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Student").snapshots(),
        builder: (context, snapshots) {
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
              body: (snapshots.data != null)
                  ? ListView.builder(
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, i) => ListTile(
                        title: Text(snapshots.data?.docs[i]["Name"]),
                        trailing: IconButton(
                            onPressed: () {
                              print(snapshots.data?.docs[i].id);
                              FirebaseFirestore.instance
                                  .collection("Student")
                                  .doc(snapshots.data?.docs[i].id)
                                  .delete();
                            },
                            icon: Icon(Icons.delete)),
                        leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("update",
                                  arguments: snapshots.data?.docs[i].id);
                            },
                            icon: Icon(Icons.edit)),
                      ),
                    )
                  : LoaderWidget(color: Colors.black));
        });
  }
}
