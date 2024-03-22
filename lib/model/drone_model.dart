import '../path.dart';

class DroneModel {
  final String name;
  final String desc;
  final double stars;
  final String imgUrl;
  final Specification specification;
  final BatteryLife batteryLife;

  DroneModel({
    required this.name,
    required this.desc,
    required this.stars,
    required this.imgUrl,
    required this.specification,
    required this.batteryLife,
  });
}

class Specification {
  final String videoQuality;
  final String transmission;
  final String flightTime;
  final String hyperlapse;

  Specification(
      {required this.videoQuality,
      required this.transmission,
      required this.flightTime,
      required this.hyperlapse});
}

class BatteryLife {
  final int chargePercentage;

  BatteryLife({required this.chargePercentage});
}

final droneModelsMock = [
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imgUrl: "$appAssets/drone_wbg_1.png",
      stars: 4.5,
      batteryLife: BatteryLife(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imgUrl: "$appAssets/drone_wbg_1.png",
      stars: 4.5,
      batteryLife: BatteryLife(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imgUrl: "$appAssets/drone_wbg_1.png",
      stars: 4.5,
      batteryLife: BatteryLife(chargePercentage: 30),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
  DroneModel(
      name: "Safety Drone",
      desc: "Wireless Control Done",
      imgUrl: "$appAssets/drone_wbg_1.png",
      stars: 4.5,
      batteryLife: BatteryLife(chargePercentage: 50),
      specification: Specification(
          videoQuality: "4K/ 30FPS",
          transmission: "7 Kilometers",
          flightTime: "30 minutes",
          hyperlapse: "4K Video")),
];
