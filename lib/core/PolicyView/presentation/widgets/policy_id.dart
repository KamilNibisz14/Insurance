import 'package:flutter/material.dart';
import 'package:insurance/core/constants.dart';

// ignore: must_be_immutable
class PolicyIDWidget extends StatelessWidget {
  PolicyIDWidget({
    Key? key, required this.policyID,
    required this.fontSize
  }) : super(key: key);

  String policyID;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(top: screenPadding),
      padding: const EdgeInsets.only(bottom: screenPadding),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: borderWidth, color: Colors.black54)
          )
      ),
      child: Text(
        policyID,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize
        ),
      ),
    );
  }
}
