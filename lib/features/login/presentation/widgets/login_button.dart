import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonHeight = screenHeight / 17;
    double buttonWidth = screenWidth / 1.8;
    double borderCircular = screenWidth / 10;
    double fontSize = screenWidth / 20;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(borderCircular)
        ),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
