import 'package:flutter/material.dart';

class DroneFeature extends StatefulWidget {
  const DroneFeature({super.key});

  @override
  State<DroneFeature> createState() => _DroneFeatureState();
}

class _DroneFeatureState extends State<DroneFeature> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Drone Feature Screen'),
      ),
    );
  }
}
