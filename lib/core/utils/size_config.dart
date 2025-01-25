import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktop = 1300;
  static const double tablet = 800;

  static late double width, height;

  static init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
