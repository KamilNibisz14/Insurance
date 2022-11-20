import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key, 
    required this.label, 
    this.keyboardtype, 
    required this.getData, 
    this.validator,
    this.initialState = '',
    });
  
  var getData;
  var validator;
  String label;
  TextInputType? keyboardtype = TextInputType.text;
  String initialState;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textFieldHeight = width /4;

    return SizedBox(
      height: textFieldHeight,
      child: TextFormField(
        initialValue: initialState,
          keyboardType: keyboardtype,
          onChanged: (value) {
            getData(value);
          },
          decoration: InputDecoration(
            labelText: label,
          ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
      ),
    );
  }
}
