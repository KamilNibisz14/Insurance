import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/navigation_data.dart';
import '../../navigation_bloc/navigation_bloc.dart';
import '../../widgets/bottom_navigation_form.dart';
import '../../widgets/top_bar_info.dart';
import '../forms/policy_duration_form.dart';

class PolicyDurationFormPage extends StatelessWidget {
  static const String id = 'policy_duration_form';
  const PolicyDurationFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black87,
         leading: BlocListener<NavigationBloc, NavigationState>(
           listener: (context, state) {},
           child: GestureDetector(
             onTap: () {
               context.read<NavigationBloc>().add(UnenableToGoNextPageEvent());
               Navigator.pop(context);
             },
             child: const Icon(Icons.arrow_back),
           ),
         ),
        actions: [
          TopBarInfo(text: 'Policy Duration', icon: Icons.date_range,),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PolicyDurationForm(),
            BottomNavigationForm(
              position: NavigationData.policyDuration,
            )
          ],
        ),
      ),
    );
  }
}