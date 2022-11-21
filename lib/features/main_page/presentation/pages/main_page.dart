import 'package:flutter/material.dart';
import 'package:insurance/features/add_policy/presentation/pages/forms_page/policy_duration_form_page.dart';

import '../../../search_policy/presentation/pages/search_policy_page.dart';
import '../widgets/button.dart';

class MainPage extends StatelessWidget {
  static const String id = 'main_page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth / 4.5;


    const double containerMarginBottom = 60.0;


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: containerMarginBottom),
            child: Center(
              child: Hero(
                  tag: 'logo',
                  child: Image.asset('img/car.png', height: imageWidth)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionSelectionButton(iconData: Icons.add, goToPageAction: (){
                Navigator.pushNamed(context, PolicyDurationFormPage.id);
              },),
              ActionSelectionButton(iconData: Icons.search, goToPageAction: (){
                Navigator.pushNamed(context, SearchPolicyPage.id);
              },),
            ],
          )
        ],
      ),
    );
  }
}