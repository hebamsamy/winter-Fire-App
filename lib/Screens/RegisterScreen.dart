import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String Email = "";
  String Password = "";
  bool isShowen = false;
  save() async {
    try {
      var respone = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);

      print(respone.user?.uid);
      Navigator.of(context).popAndPushNamed("login");
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Hero(
                tag: "logo",
                child: Container(
                  height: 200,
                  child: Image.asset("images/logo.jfif"),
                )),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(label: Text("User Email")),
              onChanged: (value) {
                setState(() {
                  this.Email = value;
                });
              },
            ),
            TextField(
              obscureText: isShowen,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  label: Text("User Password"),
                  suffix: IconButton(
                    icon: (isShowen)
                        ? Icon(Icons.password)
                        : Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        // not true ==false
                        this.isShowen = !this.isShowen;
                      });
                    },
                  )),
              onChanged: (value) {
                setState(() {
                  this.Password = value;
                });
              },
            ),
            OutlinedButton.icon(
                onPressed: save,
                icon: Icon(Icons.add_circle),
                label: Text("Register"))
          ],
        ),
      ),
    );
  }
}
