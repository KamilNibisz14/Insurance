import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBarInfo extends StatelessWidget {
  TopBarInfo({
    super.key,
    required this.icon,
    required this.text
    });

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topBarInfoHeight = screenHeight / 15;
    double iconSize = screenHeight / 30;
    double fontSize = screenHeight / 45;
    return SizedBox(
      height: topBarInfoHeight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                size: iconSize,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}