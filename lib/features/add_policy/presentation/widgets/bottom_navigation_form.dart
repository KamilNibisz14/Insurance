import 'package:flutter/material.dart';

import '../../domain/entities/navigation_data.dart';

// ignore: must_be_immutable
class BottomNavigationForm extends StatelessWidget {
  BottomNavigationForm({
    super.key,
    required this.position,
  });
  NavigationData position;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomNavigationHeight = screenHeight / 15;
    double iconSize = (screenHeight / 97) * (screenWidth / 97);
     
    return SizedBox(
      width: screenWidth,
      height: bottomNavigationHeight,
      child: Row(
        children: [
          Expanded(child: Center(
            child: Icon(
              Icons.date_range,
              color: position == NavigationData.policyDuration ?Colors.blueAccent:Colors.transparent,
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.person,
              color: position == NavigationData.carOwner ?Colors.blueAccent:Colors.transparent,
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.person,
              color: position == NavigationData.carUser ?Colors.blueAccent:Colors.transparent,
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.time_to_leave,
              color: position == NavigationData.car ?Colors.blueAccent:Colors.transparent,
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.car_crash,
              color: position == NavigationData.insuranceCoverage ?Colors.blueAccent:Colors.transparent,
              size: iconSize,
            ),
          )),
        ],
      ),
    );
  }
}