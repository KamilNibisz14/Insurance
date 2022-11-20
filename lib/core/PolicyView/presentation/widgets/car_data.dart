import 'package:flutter/material.dart';

import '../../../constants.dart';

// ignore: must_be_immutable
class CarDataWidgets extends StatelessWidget {
  CarDataWidgets({
    Key? key,
    required this.fontSize,
    required this.iconSize,
    required this.brand,
    required this.dateOfProduction,
    required this.model,
    required this.registrationNumber,
    required this.vinNumber,
    required this.weight,
    required this.numberOfSeats,
    required this.engineCapacity,
    required this.enginePower
  }) : super(key: key);

  String brand;
  String model;
  String registrationNumber;
  String vinNumber;
  String dateOfProduction;
  String engineCapacity;
  String enginePower;
  String weight;
  String numberOfSeats;
  double fontSize;
  double iconSize;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: widgetDataPadding),
                child: Icon(
                  Icons.car_repair_rounded,
                  size: iconSize,
                ),
              ),
              Text(
                'Car',
                style: TextStyle(
                    fontSize: fontSize
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(widgetDataPadding),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: widgetDataPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            brand,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            model,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            dateOfProduction,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            registrationNumber,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: widgetDataPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            vinNumber,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            '$engineCapacity cm3',
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            '$enginePower km',
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            '$weight kg',
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            'number of seats: $numberOfSeats',
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
