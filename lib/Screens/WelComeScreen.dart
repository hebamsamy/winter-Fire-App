import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    // animation = ColorTween(begin: Colors.red, end: Colors.blue).animate();
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
      print(controller!.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    print("leave welcome page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(controller!.value),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: const TextStyle(fontSize: 30.0, color: Colors.black),
                child: AnimatedTextKit(
                  repeatForever: true,
                  pause: Duration(seconds: 5),
                  animatedTexts: [TypewriterAnimatedText("Welcome to our App")],
                ),
              ),
              Hero(
                tag: "logo",
                child: Container(
                  height: 300,
                  child: Image.asset("images/logo.jfif"),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("list");
                  },
                  child: Text("Students List")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("add");
                  },
                  child: Text("Add Student")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: Text("Login")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("register");
                  },
                  child: Text("Register")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("profile");
                  },
                  child: Text("Profile")),
            ]),
      ),
    );
  }
}
