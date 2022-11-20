import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:insurance/features/main_page/presentation/pages/main_page.dart';

import '../../../../core/PolicyView/presentation/policy_view.dart';

class AddPolicyViewPage extends StatelessWidget {
  static const String id = 'app_policy_view_page';
  const AddPolicyViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonFontSize = screenWidth / 23;
    return Scaffold(
      body: BlocBuilder<AddPolicyBloc, AddPolicyState>(
          builder: (context, state) {
            if(state is PolicyViewState){
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PolicyView(policyData: state.policyData),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20,bottom: 20),
                        child: ElevatedButton(
                          onPressed: () { 
                            context.read<NavigationBloc>().add(UnenableToGoNextPageEvent());
                            context.read<AddPolicyBloc>().add(SaveDataEvent());
                            Navigator.pushNamed(context, MainPage.id);
                           },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Save',
                              style: TextStyle(
                                fontSize: buttonFontSize
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
