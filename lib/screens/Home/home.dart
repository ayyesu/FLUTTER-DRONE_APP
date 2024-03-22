import 'package:flutter/material.dart';
import 'package:myapp/core/styles.dart';
import 'package:myapp/model/drone_model.dart';
import 'package:myapp/screens/Home/Widgets/arrow_widget.dart';
import 'package:myapp/screens/Home/Widgets/popular_drone_widget.dart';
import 'package:myapp/screens/Home/Widgets/search_filed_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/screens/Home/base_scroll_screen.dart';
import '../../path.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  /// width of the drone at ListView.builder position
  double pieceWidth = 100.0;
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void setPieceWidth(double containerWidth) {
    pieceWidth = containerWidth;
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      final metrics = scrollController.offset;
      final result = metrics ~/ pieceWidth;

      final scrollingToRight = scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;

      if (scrollingToRight && result > currentIndex.value ||
          !scrollingToRight && result < currentIndex.value) {
        setCurrentIndex(result);
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return BaseScrollScreen(
      showBottomNavigationBar: true,
      child: IntrinsicHeight(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildHorizontalPopularDrones(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // maxWidth: MediaQuery.of(context).size.width,
        // minWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.width * 0.75,
        minHeight: MediaQuery.of(context).size.width * 0.75,

        // maxHeight: MediaQuery.of(context).size.width
        // minHeight: MediaQuery.of(context).size.width ,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // int index = -1;
          return Stack(
            fit: StackFit.expand,
            children: [
              ListView.builder(
                controller: controller.scrollController,
                itemCount: droneModelsMock.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) =>
                    _buildDrone(context, droneModelsMock[index], index),
              ),
              const Positioned(
                bottom: 0,
                right: kDefaultMargin,
                child: ArrowsWidget(turnOnRight: true),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrone(BuildContext context, DroneModel drone, int index) {
    return Obx(() {
      final isFirstDroneAtList = controller.currentIndex.value == index;
      final popularDroneWidth = MediaQuery.of(context).size.width / 1.8;

      controller.setPieceWidth(popularDroneWidth);

      return PopularDroneWidget(
        drone: drone,
        isFirstDroneAtList: isFirstDroneAtList,
        width: popularDroneWidth,
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: _buildHeader(),
          ),
          const SizedBox(height: kLargeMargin),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Discover this year\'s hottest drone',
                style: kTitleTextStyle),
          ),
          const SizedBox(height: kLargeMargin),
          const Padding(
              padding: EdgeInsets.all(12.0), child: SearchFieldWidget()),
          const SizedBox(height: kLargeMargin),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: RichText(
              text: const TextSpan(
                  text: 'Popular ',
                  style: kSubTitleTextStyle,
                  children: [TextSpan(text: 'Drone', style: kTitleTextStyle)]),
            ),
          ),
          const SizedBox(height: kDefaultMargin),
          _buildHorizontalPopularDrones(context)
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _buildHeader extends StatelessWidget {
  const _buildHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.0,
          width: 80.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              '$appAssets/person.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adila Sajon',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Premium Customer',
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: _buildBellIcon(),
        ),
        const Column(),
      ],
    );
  }
}

// ignore: camel_case_types
class _buildBellIcon extends StatelessWidget {
  const _buildBellIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      child: const Icon(Icons.notifications),
    );
  }
}
