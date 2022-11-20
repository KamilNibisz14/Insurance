import 'package:flutter/material.dart';

import '../../../constants.dart';

// ignore: must_be_immutable
class PersonalDataWidget extends StatelessWidget {
  PersonalDataWidget({Key? key,
    required this.fontSize,
    required this.name,
    required this.apartment,
    required this.city,
    required this.personalID,
    required this.street,
    required this.surname,
    required this.postal,
    required this.typeOfClient,
    required this.iconSize,
  }) : super(key: key);

  String name;
  String surname;
  String typeOfClient;
  String personalID;
  String postal;
  String city;
  String street;
  String apartment;
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
                  Icons.person,
                  size: iconSize,
                ),
              ),
              Text(
                typeOfClient,
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
                            surname,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            personalID,
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
                            city,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            street,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            apartment,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: widgetDataPadding),
                          child: Text(
                            postal,
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
