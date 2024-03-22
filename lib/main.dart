import 'package:flutter/material.dart';
import 'package:myapp/screens/Home/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {'/': (context) => Home()},
  ));
}
