import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationForm extends StatelessWidget {
  BottomNavigationForm({
    super.key,
    required this.position,
  });
  int position;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double bottonNavigationHeight = screenHeight / 15;
    double iconSize = (screenHeight / 97) * (screenWidth / 97);
     
    return SizedBox(
      width: screenWidth,
      height: bottonNavigationHeight,
      child: Row(
        children: [
          Expanded(child: Center(
            child: Icon(
              Icons.date_range,
              color: position == 1 ?Colors.blueAccent:Colors.transparent, 
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.person,
              color: position == 2 ?Colors.blueAccent:Colors.transparent, 
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.person,
              color: position == 3 ?Colors.blueAccent:Colors.transparent, 
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.time_to_leave,
              color: position == 4 ?Colors.blueAccent:Colors.transparent, 
              size: iconSize,
            ),
          )),
          Expanded(child: Center(
            child: Icon(
              Icons.car_crash,
              color: position == 5 ?Colors.blueAccent:Colors.transparent, 
              size: iconSize,
            ),
          )),
        ],
      ),
    );
  }
}