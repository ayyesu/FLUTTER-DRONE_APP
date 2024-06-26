import 'package:flutter/material.dart';

class BNavRouter {
  static to(BuildContext context, {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static toOffAll(BuildContext context, {required Widget page}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static back(BuildContext context) => Navigator.pop(context);
}
