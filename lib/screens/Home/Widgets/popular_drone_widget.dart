import 'package:flutter/material.dart';
import 'package:myapp/model/drone_model.dart';
import 'package:myapp/screens/Drone_Details/drone_details.dart';

import '../../../core/router/router.dart';
import '../../../core/styles.dart';

class PopularDroneWidget extends StatelessWidget {
  final DroneModel drone;
  final bool isFirstDroneAtList;
  final double width;

  const PopularDroneWidget(
      {Key? key,
      required this.drone,
      required this.isFirstDroneAtList,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
          width: width,
          margin: EdgeInsets.only(
            right: isFirstDroneAtList ? 0 : kDefaultMargin,
          ),
          padding: EdgeInsets.only(
            bottom: isFirstDroneAtList ? 0 : kDefaultMargin * 3,
          ),
          child: GestureDetector(
            onTap: () {
              BNavRouter.to(context,
                  page: const DroneDetails(/**droneModel: drone**/));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: kDefaultMargin),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: kDefaultMargin),
                            const Icon(Icons.star, color: kAccentColor),
                            const SizedBox(width: 4.0),
                            Text(
                              '4.5',
                              style: kSubTitleTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: kDefaultMargin),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Opacity(
                          opacity: isFirstDroneAtList ? 0 : 1,
                          child: Padding(
                            padding: const EdgeInsets.all(kSmallMargin),
                            child: Image.asset(drone.imgUrl,
                                fit: BoxFit.cover,
                                width: isFirstDroneAtList
                                    ? null
                                    : MediaQuery.of(context).size.width),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultMargin),
                        child: Text(drone.name,
                            style: kSubTitleTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultMargin),
                        child: Text(
                          drone.desc,
                          style: kSmallTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultMargin),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isFirstDroneAtList)
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(
                  right: 2,
                  // a security margin
                  bottom: kSmallMargin),
              //color: Colors.red.withOpacity(0.2),
              child: Image.asset(
                drone.imgUrl,
                width: width + (kDefaultMargin * 2),
              ),
            ),
          ),
      ],
    );
  }
}