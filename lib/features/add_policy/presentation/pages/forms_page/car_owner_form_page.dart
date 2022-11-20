import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';

import '../../widgets/bottom_navigation_form.dart';
import '../../widgets/top_bar_info.dart';
import '../forms/car_owner_form.dart';

class CarOwnerFormPage extends StatelessWidget {
  static const String id = 'car_owner_page';
  const CarOwnerFormPage({super.key});
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
              text: 'Owner',
              icon: Icons.person,
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CarOwnerForm(),
            BottomNavigationForm(
              position: 2,
            )
          ],
        ),
      ),
    );
  }
}
