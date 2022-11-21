import 'package:flutter/material.dart';
import '../widgets/form.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth / 5;
    double textFieldWidth = screenWidth / 1.25;
      return Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'logo',
                    child: Image.asset('img/car.png', height: imageWidth)),
              ],
            )),
            SizedBox(
              width: textFieldWidth,
              child: const LoginForm())
          ],
        ),
    ),);
  }
}
