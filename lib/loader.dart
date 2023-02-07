import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {
  Color color;
  LoaderWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: color,
    );
  }
}
