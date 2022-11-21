import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PremiumsDropdownButton extends StatefulWidget {
  PremiumsDropdownButton({
    Key? key,
    required this.getData
  }) : super(key: key);
  var getData;
  @override
  State<PremiumsDropdownButton> createState() => _PremiumsDropdownButtonState();

}

class _PremiumsDropdownButtonState extends State<PremiumsDropdownButton> {
  List<int> arrayOfPremiums = [1,2,3,4];
  int firstValue = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<int>(
        value: firstValue,
        onChanged: (int? value){
          setState(() {
            widget.getData(value);
            firstValue = value!;
          });
        },
        items: arrayOfPremiums.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString(),style: const TextStyle(fontSize: 18),),
          );
        }).toList(),
      ),
    );
  }
}
