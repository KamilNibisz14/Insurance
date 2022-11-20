import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:insurance/features/search_policy/presentation/navigation/search_policy_navigation_bloc.dart';

class SearchPolicyTextFieldForm extends StatelessWidget {
  SearchPolicyTextFieldForm({Key? key, required this.getData})
      : super(key: key);

  var getData;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double textFormFieldwidth = screenWidth / 1.2;
    final formKey = GlobalKey<FormState>();

    void IfFormIsCorrect() {
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
                IfFormIsCorrect(); 
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter policy ID',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                FormBuilderValidators.maxLength(13),
                FormBuilderValidators.minLength(13),
              ])),
        ),
      ),
    );
  }
}
