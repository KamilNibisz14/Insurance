import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/navigation_data.dart';
import '../../navigation_bloc/navigation_bloc.dart';
import '../../widgets/bottom_navigation_form.dart';
import '../../widgets/top_bar_info.dart';
import '../forms/insurance_coverage_form.dart';

class InsuranceCoverageFormPage extends StatelessWidget {
  static const String id = 'insurance_coverage_page';
  const InsuranceCoverageFormPage({Key? key}) : super(key: key);

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
            icon: Icons.car_crash,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const InsuranceCoverageForm(),
            BottomNavigationForm(
              position: NavigationData.insuranceCoverage,
            )
          ],
        ),
      ),
    );
  }
}
