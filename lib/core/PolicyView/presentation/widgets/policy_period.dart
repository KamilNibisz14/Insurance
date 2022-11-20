import 'package:flutter/material.dart';
import 'package:insurance/core/constants.dart';

// ignore: must_be_immutable
class PolicyPeriodWidget extends StatelessWidget {
  PolicyPeriodWidget({
    Key? key,
    required this.fontSize,
    required this.iconSize,
    required this.dateOfConclusion,
    required this.periodFrom,
    required this.periodUntil
  }) : super(key: key);

  String dateOfConclusion;
  String periodFrom;
  String periodUntil;
  double iconSize;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: screenPadding),
      padding: const EdgeInsets.only(bottom: screenPadding),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: borderWidth, color: Colors.black54)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: widgetDataPadding),
                child: Icon(
                  Icons.time_to_leave,
                  size: iconSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: widgetDataPadding),
                child: Text(dateOfConclusion,
                style: TextStyle(
                  fontSize: fontSize,
                ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: widgetDataPadding),
                child: Text(periodFrom,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
              Text(
                '-',
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: widgetDataPadding),
                child: Text(periodUntil,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
