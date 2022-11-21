import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:insurance/features/add_policy/domain/entities/car_user_data.dart';
import 'package:insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:insurance/features/add_policy/presentation/pages/forms_page/car_form_page.dart';

import '../../widgets/custom_text_form.dart';
import '../../widgets/next_form_button.dart';
import 'form_constants.dart';

// ignore: must_be_immutable
class CarUserForm extends StatelessWidget {
  const CarUserForm({super.key});

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    CarUserData initialTextField = CarUserData();
    initialTextField.name = context.read<AddPolicyBloc>().carOwnerData.name;
    initialTextField.surname = context.read<AddPolicyBloc>().carOwnerData.surname;
    initialTextField.personalID = context.read<AddPolicyBloc>().carOwnerData.personalID;
    initialTextField.city = context.read<AddPolicyBloc>().carOwnerData.city;
    initialTextField.street = context.read<AddPolicyBloc>().carOwnerData.street;
    initialTextField.apartmentNumber = context.read<AddPolicyBloc>().carOwnerData.apartmentNumber;
    initialTextField.houseNumber = context.read<AddPolicyBloc>().carOwnerData.houseNumber;
    initialTextField.postalNumber = context.read<AddPolicyBloc>().carOwnerData.postalNumber;
    initialTextField.middleName = context.read<AddPolicyBloc>().carOwnerData.middleName;
    CarUserData carUserData = initialTextField;
    // ignore: non_constant_identifier_names
    void IfFormIsCorrect() {
      if (formKey.currentState!.validate()) {
        context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
      } else {
        context.read<NavigationBloc>().add(UnenableToGoNextPageEvent());
      }
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {},
        ),
        BlocListener<AddPolicyBloc, AddPolicyState>(
          listener: (context, state) {},
        ),
      ],
      child: Expanded(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(formMargin),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Name*',
                                    initialState: initialTextField.name,
                                    getData: (String arg) {
                                      carUserData.name = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Middle Name',
                                    initialState: initialTextField.middleName == null ? '': initialTextField.middleName!,
                                    getData: (String arg) {
                                      carUserData.middleName = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Surname*',
                                    initialState: initialTextField.surname,
                                    getData: (String arg) {
                                      carUserData.surname = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Personal ID*',
                                    initialState: initialTextField.personalID,
                                    getData: (String arg) {
                                      carUserData.personalID = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(
                                          errorText:
                                              'Personal ID contains only number'),
                                      FormBuilderValidators.maxLength(11,
                                          errorText: 'Personal ID have 11 numbers'),
                                      FormBuilderValidators.minLength(11,
                                          errorText: 'Personal ID have 11 numbers'),
                                    ])),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'City*',
                                    initialState: initialTextField.city,
                                    getData: (String arg) {
                                      carUserData.city = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Street*',
                                    initialState: initialTextField.street,
                                    getData: (String arg) {
                                      carUserData.street = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'House Number*',
                                    initialState: initialTextField.houseNumber,
                                    getData: (String arg) {
                                      carUserData.houseNumber = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                      FormBuilderValidators.min(1)
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Apartment Number*',
                                    initialState: initialTextField.apartmentNumber,
                                    getData: (String arg) {
                                      carUserData.apartmentNumber = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                      FormBuilderValidators.min(1)
                                    ])),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: customFormFieldPadding),
                                child: CustomTextForm(
                                    label: 'Postal Address*',
                                    initialState: initialTextField.postalNumber,
                                    getData: (String arg) {
                                      carUserData.postalNumber = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.maxLength(6),
                                      FormBuilderValidators.minLength(6),
                                      (val) {
                                        if (!val
                                            .toString()
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "Invalid Postal Address";
                                        }
                                        if (val.toString().length > 2) {
                                          if (val.toString()[2] != '-') {
                                            return "Invalid Postal Address";
                                          }
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: customFormFieldPadding),
                                      child: Container())),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: bottomFormPadding))
                        ],
                      ),
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: NextFormButton(
                  onTap: () {
                    context.read<NavigationBloc>().add(UnenableToGoNextPageEvent());
                    context.read<AddPolicyBloc>().add(AddCarUserData(carUserData: carUserData));
                    Navigator.pushNamed(context, CarFormPage.id);
                  },
                ))
          ],
        ),
      ),
    );
  }
}