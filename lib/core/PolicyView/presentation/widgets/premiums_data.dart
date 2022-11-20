import 'package:flutter/material.dart';

import '../../../constants.dart';

// ignore: must_be_immutable
class PremiumsDataWidget extends StatelessWidget {
  PremiumsDataWidget({
    Key? key,
    required this.datesOfPremiums,
    required this.premiums,
    required this.fontSize,
    required this.iconSize,
    required this.titleTextSize
  }) : super(key: key);

  List<String> datesOfPremiums;
  List<int> premiums;
  double fontSize;
  double iconSize;
  double titleTextSize;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Expanded> getPremiums(){
      List<Expanded> listOfPremiums = [];
      for(int i = 0; i < premiums.length; ++i){
        listOfPremiums.add(
          Expanded(
            child: Column(
              children: [
                Text(
                  datesOfPremiums[i],
                  style: TextStyle(
                      fontSize: fontSize
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(top: widgetDataPadding),
                  child: Text(
                    premiums[i].toString(),
                    style: TextStyle(
                        fontSize: fontSize
                    ),
                  ),
                )
              ],
            ),
          )
        );
      }

      return listOfPremiums;
    }
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 20,right: 10, left: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.black54)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.monetization_on,
                size: iconSize,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Premiums',
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: getPremiums(),
            ),
          ),
        ],
      ),
    );
  }
}
