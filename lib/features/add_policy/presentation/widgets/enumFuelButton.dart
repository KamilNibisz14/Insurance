import 'package:flutter/material.dart';

import '../../domain/entities/fuel_type_enum.dart';

// ignore: must_be_immutable
class EnumFuelDropdownButton extends StatefulWidget {
  EnumFuelDropdownButton({
    Key? key, required this.getData
  }) : super(key: key);
  var getData;
  @override
  State<EnumFuelDropdownButton> createState() => _EnumFuelDropdownButtonState();
}

class _EnumFuelDropdownButtonState extends State<EnumFuelDropdownButton> {
  String firstValue = FuelType.Petrol.name;
  @override
  Widget build(BuildContext context) {
    List<String> arrayOfFuel = [  'Petrol', 'Diesel', 'Hybrid', 'LPG', 'Electric'];
    return DropdownButton<String>(
        value: firstValue,
        onChanged: (String? value){
          setState(() {
            widget.getData(value);
            firstValue = value!;
          });
        },
        items: arrayOfFuel.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: const TextStyle(fontSize: 18),),
          );
        }).toList(),
    );
  }
}
