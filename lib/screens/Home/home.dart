import 'package:flutter/material.dart';
import 'package:myapp/core/styles.dart';
import 'package:myapp/screens/Home/Widgets/search_filed_widget.dart';
import '../../path.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

// ignore: camel_case_types
class _buildBody extends StatelessWidget {
  const _buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: _buildHeader(),
          ),
          SizedBox(height: kLargeMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Discover this year\'s hottest drone',
              style: kTitleTextStyle
            ),
          ),
          SizedBox(height: kLargeMargin),
          Padding(padding: EdgeInsets.all(12.0), child: SearchFieldWidget())
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
