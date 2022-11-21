import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/insurance_coverage_data.dart';
import '../../bloc/add_policy_bloc.dart';
import '../../navigation_bloc/navigation_bloc.dart';
import '../../widgets/insurance_coverage_checkbox.dart';
import '../../widgets/next_form_button.dart';
import '../../widgets/premiums_dropdown_button.dart';
import '../policy_view.dart';
import 'form_constants.dart';

class InsuranceCoverageForm extends StatelessWidget {
  const InsuranceCoverageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textSize = width/25;
    double premiumsContainerWidth = width / 3.5;

    InsuranceCoverageData insuranceCoverageData = InsuranceCoverageData();
    int numberOfPremiums = 1;

    const double premiumsTopPadding = 40;
    const double premiumsRightPadding = 50;
    const double premiumsDropdownButtonTopPadding = 20;

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
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.all(formMargin),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blueAccent.withOpacity(0.7),
                              value: true,
                              onChanged: (_){},
                            ),
                            Text('OC',
                            style: TextStyle(
                              fontSize: textSize,
                              color: Colors.black.withOpacity(0.7)
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasAC = value;
                              },
                            ),
                            Text('AC',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasKR = value;
                              },
                            ),
                            Text('KR',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasNNW = value;
                              },                                
                            ),
                            Text('NNW',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasASS = value;
                              },                                
                            ),
                            Text('ASS',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasBLS = value;
                              },                                
                            ),
                            Text('BLS',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasWAS = value;
                              },                                
                            ),
                            Text('WAS',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasTires = value;
                              },                                
                            ),
                            Text('Tires',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            InsuranceCoverageCheckbox(
                              getData: (value){
                                insuranceCoverageData.hasWindows = value;
                              },                                
                            ),
                            Text('Windows',
                              style: TextStyle(
                                  fontSize: textSize
                              ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(top: premiumsTopPadding, right: premiumsRightPadding),
                child: SizedBox(
                  width: premiumsContainerWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Premiums',
                        style: TextStyle(
                          fontSize: textSize,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: premiumsDropdownButtonTopPadding),
                        width: premiumsContainerWidth,
                        child: PremiumsDropdownButton(
                          getData: (value){
                            numberOfPremiums = value;
                          },
                        ),
                      )
                    ],
                    
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: NextFormButton(
                  onTap: () {
                    context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
                    context.read<AddPolicyBloc>().add(AddInsuranceCoverage(insuranceCoverageData: insuranceCoverageData));
                    context.read<AddPolicyBloc>().add(AddNumbersOfPremiums(numberOfPremiums: numberOfPremiums));
                    context.read<AddPolicyBloc>().add(CalculatePremiumsEvent());
                    Navigator.pushNamed(context, AddPolicyViewPage.id);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
