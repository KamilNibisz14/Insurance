import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:insurance/features/add_policy/presentation/pages/forms_page/car_user_form_page.dart';

import '../../../domain/entities/car_owner_data.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/next_form_button.dart';

class CarOwnerForm extends StatelessWidget {
  const CarOwnerForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    CarOwnerData carOwnerData = CarOwnerData();
    void IfFormIsCorrect() {
      if (_formKey.currentState!.validate()) {
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
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: CustomTextForm(
                                    label: 'Name*',
                                    getData: (String arg) {
                                      carOwnerData.name = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomTextForm(
                                    label: 'Middle Name',
                                    getData: (String arg) {
                                      carOwnerData.middleName = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
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
                                padding: const EdgeInsets.only(right: 15),
                                child: CustomTextForm(
                                    label: 'Surname*',
                                    getData: (String arg) {
                                      carOwnerData.surname = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomTextForm(
                                    label: 'Personal ID*',
                                    getData: (String arg) {
                                      carOwnerData.personalID = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(
                                          errorText:
                                              'Pesel contains only number'),
                                      FormBuilderValidators.maxLength(11,
                                          errorText: 'Pesel have 11 numbers'),
                                      FormBuilderValidators.minLength(11,
                                          errorText: 'Pesel have 11 numbers'),
                                    ])),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: CustomTextForm(
                                    label: 'City*',
                                    getData: (String arg) {
                                      carOwnerData.city = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
                                          return "field can't contain number";
                                        }
                                        return null;
                                      }
                                    ])),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomTextForm(
                                    label: 'Street*',
                                    getData: (String arg) {
                                      carOwnerData.street = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      (val) {
                                        if (val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
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
                                padding: const EdgeInsets.only(right: 15),
                                child: CustomTextForm(
                                    label: 'House Number*',
                                    getData: (String arg) {
                                      carOwnerData.houseNumber = arg;
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
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomTextForm(
                                    label: 'Apartment Number*',
                                    getData: (String arg) {
                                      carOwnerData.apartmentNumber = arg;
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
                                padding: const EdgeInsets.only(right: 15),
                                child: CustomTextForm(
                                    label: 'Postal Address*',
                                    getData: (String arg) {
                                      carOwnerData.postalNumber = arg;
                                      IfFormIsCorrect();
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.maxLength(6),
                                      FormBuilderValidators.minLength(6),
                                      (val) {
                                        if (!val
                                            .toString()
                                            .contains(new RegExp(r'[0-9]'))) {
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
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container())),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 60))
                        ],
                      ),
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: NextFormButton(
                  onTap: () {
                    //context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
                    context.read<AddPolicyBloc>().add(AddCarOwnerData(carOwnerData: carOwnerData));
                    Navigator.pushNamed(context, CarUserFormPage.id);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
