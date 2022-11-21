import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InsuranceCoverageCheckbox extends StatefulWidget {
  InsuranceCoverageCheckbox({
    Key? key,
    required this.getData
    }) : super(key: key);
  var getData;

  @override
  State<InsuranceCoverageCheckbox> createState() => _InsuranceCoverageCheckboxState();
}

class _InsuranceCoverageCheckboxState extends State<InsuranceCoverageCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blueAccent;
      }
      return Colors.blueAccent;
    }
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.getData(value);
        });
      },
    );
  }
}
