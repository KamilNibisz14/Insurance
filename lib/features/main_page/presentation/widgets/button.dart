import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionSelectionButton extends StatelessWidget {
  ActionSelectionButton({Key? key, required this.iconData, required this.goToPageAction}) : super(key: key);
  VoidCallback goToPageAction;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonSize = screenWidth /4.5 ;
    double iconDataSize = screenWidth / 14;
    double borderRadius = screenWidth/ 17;
    return GestureDetector(
      onTap: goToPageAction,
      child: Container(
        height: buttonSize,
        width:  buttonSize,
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.9),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Icon(
            iconData,
            size: iconDataSize,
            color: Colors.white,
          ),),
      ),
    );
  }
}
