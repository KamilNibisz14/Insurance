import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:insurance/features/search_policy/presentation/navigation/search_policy_navigation_bloc.dart';

// ignore: must_be_immutable
class SearchPolicyTextFieldForm extends StatelessWidget {
  SearchPolicyTextFieldForm({Key? key, required this.getData})
      : super(key: key);

  var getData;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double textFormFieldwidth = screenWidth / 1.2;
    final formKey = GlobalKey<FormState>();


    const double textInputPaddingVertical = 10.0;
    const double textInputPaddingHorizontal = 10.0;
    const int policyLength = 13;


    void ifFormIsCorrect() {
      if (formKey.currentState!.validate()) {
        context.read<SearchPolicyNavigationBloc>().add(EnableToGoNextPageEvent());
      } else {
        context.read<SearchPolicyNavigationBloc>().add(UnenableToGoNextPageEvent());
      }
    }

    return BlocListener<SearchPolicyNavigationBloc, SearchPolicyNavigationState>(
      listener: (context, state) {
      },
      child: Form(
        key: formKey,
        child: SizedBox(
          width: textFormFieldwidth,
          child: TextFormField(
            initialValue: '90857',
              onChanged: (value) {
                getData(value);
                ifFormIsCorrect();
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter policy ID',
                contentPadding:
                    EdgeInsets.symmetric(vertical: textInputPaddingVertical, horizontal: textInputPaddingHorizontal),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.numeric(),
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(policyLength),
                FormBuilderValidators.minLength(policyLength),
              ])),
        ),
      ),
    );
  }
}
