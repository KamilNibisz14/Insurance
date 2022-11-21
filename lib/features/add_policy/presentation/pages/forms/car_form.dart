import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';

import '../../../domain/entities/car_data.dart';
import '../../../domain/entities/fuel_type_enum.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/enumFuelButton.dart';
import '../../widgets/next_form_button.dart';
import '../forms_page/insurance_coverage_form_page.dart';
import 'form_constants.dart';


class CarForm extends StatelessWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    bool dateValidate = false;
    double width = MediaQuery.of(context).size.width;
    double textFieldHeight = width /4;
    CarData carData = CarData();

    String numberOfSeats = '';
    String engineCapacity = '';
    String enginePower = '';
    String weight = '';


    const double dataRangePickerIconPadding = 50;
    const double iconSize = 30;
    const double dataRangePickerTopPadding = 60;
    const double dataRangePickerHorizontalPadding = 10;


    // ignore: non_constant_identifier_names
    void IfFormIsCorrect() {
      if (formKey.currentState!.validate() && dateValidate) {
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
                                        label: 'Brand*',
                                        getData: (String arg) {
                                          carData.brand = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                              (val){
                                            if (val.toString().contains(RegExp(r'[0-9]')))
                                            {
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
                                        label: 'Model*',
                                        getData: (String arg) {
                                          carData.model = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                           FormBuilderValidators.required()
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
                                        label: 'Country of registration*',
                                        getData: (String arg) {
                                          carData.countryOfRegistration = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.minLength(3),
                                          FormBuilderValidators.maxLength(3),
                                              (val){
                                            if (val.toString().contains(RegExp(r'[0-9]')))
                                            {
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
                                        label: 'Registration number*',
                                        getData: (String arg) {
                                          carData.registrationNumber = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.minLength(5),
                                          FormBuilderValidators.maxLength(7),
                                        ])
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: customFormFieldPadding),
                                    child: CustomTextForm(
                                        label: 'VIN*',
                                        getData: (String arg) {
                                          carData.vin = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxLength(17),
                                          FormBuilderValidators.minLength(17),
                                        ])),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: customFormFieldPadding),
                                    child: CustomTextForm(
                                        label: 'Engine capacity*',
                                        getData: (String arg) {
                                          engineCapacity = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.minLength(3),
                                          FormBuilderValidators.maxLength(6),
                                          FormBuilderValidators.numeric(),
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
                                        label: 'Engine power*',
                                        getData: (String arg) {
                                          enginePower = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.numeric(),
                                          FormBuilderValidators.minLength(2),
                                          FormBuilderValidators.maxLength(4),
                                        ])),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: customFormFieldPadding),
                                    child: CustomTextForm(
                                        label: 'Weight*',
                                        getData: (String arg) {
                                          weight = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.numeric(),
                                          FormBuilderValidators.maxLength(5),
                                          FormBuilderValidators.minLength(3)
                                        ])),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: customFormFieldPadding,top: customFormFieldPadding),
                                    child: CustomTextForm(
                                        label: 'Number Of seats*',
                                        getData: (String arg) {
                                          numberOfSeats = arg;
                                          IfFormIsCorrect();
                                        },
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxLength(3),
                                          FormBuilderValidators.numeric()
                                        ])),
                                  )),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: customFormFieldPadding),
                                      child: EnumFuelDropdownButton(
                                        getData: (value){
                                          if(value == 'LPG'){
                                            carData.fuelType = FuelType.LPG;
                                          }else if(value == 'Petrol'){
                                            carData.fuelType = FuelType.Petrol;
                                          }else if(value == 'Diesel'){
                                            carData.fuelType = FuelType.Diesel;
                                          }else if(value == 'Hybrid'){
                                            carData.fuelType = FuelType.Hybrid;
                                          }else if(value == 'Electric'){
                                            carData.fuelType = FuelType.Electric;
                                          }
                                      },
                                      )
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: dataRangePickerIconPadding),
                                child: Icon(Icons.date_range_rounded,size: iconSize,),
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: dataRangePickerTopPadding,top: dataRangePickerHorizontalPadding,left: dataRangePickerHorizontalPadding),
                                    child:  SizedBox(
                                        height: textFieldHeight,
                                        child: FormBuilderDateTimePicker(
                                          name: 'Production Date',
                                          helpText: 'enter date_range',
                                          fieldLabelText: 'Production Date*',
                                          fieldHintText: 'Production Date*',
                                          firstDate: DateTime(1900),
                                          inputType: InputType.date,
                                          lastDate: DateTime.now(),
                                          initialEntryMode: DatePickerEntryMode.input,
                                          textAlign: TextAlign.center,
                                          onChanged: (DateTime? arg){
                                            if(arg != null){
                                              carData.productionDate = arg;
                                              dateValidate = true;
                                              IfFormIsCorrect();
                                            }
                                          },
                                        )
                                    )
                                  )),
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

                    carData.numberOfSeats = int.parse(numberOfSeats);
                    carData.enginePower = int.parse(enginePower);
                    carData.weight = int.parse(weight);
                    carData.engineCapacity = int.parse(engineCapacity);
                    context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
                    context.read<AddPolicyBloc>().add(AddCarData(carData:carData));
                    Navigator.pushNamed(context, InsuranceCoverageFormPage.id);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
