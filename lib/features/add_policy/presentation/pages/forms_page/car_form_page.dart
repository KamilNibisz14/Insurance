import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/navigation_data.dart';
import '../../navigation_bloc/navigation_bloc.dart';
import '../../widgets/bottom_navigation_form.dart';
import '../../widgets/top_bar_info.dart';
import '../forms/car_form.dart';

class CarFormPage extends StatelessWidget {
  static const String id = 'car_page';
  const CarFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {},
          child: GestureDetector(
            onTap: () {
              context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          TopBarInfo(
            text: 'Car',
            icon: Icons.time_to_leave,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CarForm(),
            BottomNavigationForm(
              position: NavigationData.car,
            )
          ],
        ),
      ),
    );
  }
}
