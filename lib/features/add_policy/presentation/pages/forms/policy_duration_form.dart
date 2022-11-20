import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:insurance/features/add_policy/domain/entities/policy_duration_data.dart';
import 'package:insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:insurance/features/add_policy/presentation/pages/forms_page/car_owner_form_page.dart';

import '../../widgets/next_form_button.dart';

class PolicyDurationForm extends StatelessWidget {
  const PolicyDurationForm({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formBuilderDateRangePicker = screenWidth * 0.7;

    PolicyDuration policyDuration = PolicyDuration();

    return Expanded(
      child: MultiBlocListener(
        listeners: [
          BlocListener<NavigationBloc, NavigationState>(
            listener: (context, state) {},
          ),
          BlocListener<AddPolicyBloc, AddPolicyState>(
            listener: (context, state) {},
          ),
        ],
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: formBuilderDateRangePicker,
                child: FormBuilderDateRangePicker(
                  helpText: 'enter date_range',
                  name: 'date_range',
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2040),
                  initialEntryMode: DatePickerEntryMode.input,
                  textAlign: TextAlign.center,
                  onChanged: (DateTimeRange? args) {
                    if (args != null) {
                      context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
                      policyDuration.dateFrom = args.start;
                      policyDuration.dateUntil = args.end;
                    }else{

                    }
                  },
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: NextFormButton(
                  onTap: () {
                    context.read<AddPolicyBloc>().add(AddPolicyDuration(policyDuration: policyDuration));
                    context.read<NavigationBloc>().add(UnenableToGoNextPageEvent());
                    Navigator.pushNamed(context, CarOwnerFormPage.id);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
