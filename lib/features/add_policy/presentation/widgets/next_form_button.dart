import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';

// ignore: must_be_immutable
class NextFormButton extends StatelessWidget {
  NextFormButton({Key? key, required this.onTap}) : super(key: key);
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 4;
    double iconSize = screenWidth / 12;
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if(state is EnableToGoNextPageState){
          return Container(
            margin: const EdgeInsets.only(right: 20, bottom: 20),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(3, 4), // changes position of shadow
                    ),
                  ],
                ),
                width: buttonWidth,
                child: Icon(
                  Icons.arrow_forward,
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        else{
          return Container(
            margin: const EdgeInsets.only(right: 20, bottom: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(3, 4), // changes position of shadow
                  ),
                ],
              ),
              width: buttonWidth,
              child: Icon(
                Icons.arrow_forward,
                size: iconSize,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
