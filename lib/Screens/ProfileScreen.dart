import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? img;
  @override
  initState() {
    super.initState();
    getPosition();
  }

  getPosition() async {
    var p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    print(p.latitude);
    print(p.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: (img != null) ? FileImage(img!) : null,
            child: (img == null) ? Icon(Icons.add) : null,
          ),
          OutlinedButton.icon(
              onPressed: () async {
                var picker = ImagePicker();
                var selected =
                    await picker.pickImage(source: ImageSource.camera);
                if (selected != null) {
                  final snackBar = SnackBar(
                    content: Text('great Choose'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    this.img = File(selected.path);
                  });
                } else {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.lightBlue,
                    content: const Text('Con\'t get right image !!!!!!!!!!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: Icon(Icons.camera),
              label: Text("Take Photo")),
          OutlinedButton.icon(
              onPressed: () async {
                var picker = ImagePicker();
                var selected =
                    await picker.pickImage(source: ImageSource.gallery);
                if (selected != null) {
                  final snackBar = SnackBar(
                    content: Text('great Choose'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    this.img = File(selected.path);
                  });
                } else {
                  final snackBar = SnackBar(
                    content: const Text('Con\'t get right image !!!!!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: Icon(Icons.photo),
              label: Text("Choose form Gallary"))
        ]),
      ),
    );
  }
}
