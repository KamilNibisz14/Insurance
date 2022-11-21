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


    const double buttonColorOpacity = 0.9;
    const double buttonShadowOpacity = 0.5;
    const double buttonShadowOffset = 5;
    const double buttonShadowSpreadRadius = 3;
    const double buttonShadowBlurRadius = 5;


    return GestureDetector(
      onTap: goToPageAction,
      child: Container(
        height: buttonSize,
        width:  buttonSize,
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(buttonColorOpacity),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(buttonShadowOpacity),
              spreadRadius: buttonShadowSpreadRadius,
              blurRadius: buttonShadowBlurRadius,
              offset: const Offset(buttonShadowOffset, buttonShadowOffset), // changes position of shadow
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
