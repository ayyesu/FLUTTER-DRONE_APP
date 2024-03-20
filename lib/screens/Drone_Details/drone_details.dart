import 'package:flutter/material.dart';

class DroneDetails extends StatefulWidget {
  const DroneDetails({super.key});

  @override
  State<DroneDetails> createState() => _DroneDetailsState();
}

class _DroneDetailsState extends State<DroneDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Drone Details Screen'),
      ),
    );
  }
}
