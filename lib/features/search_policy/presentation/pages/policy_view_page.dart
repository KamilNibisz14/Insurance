import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/features/main_page/presentation/pages/main_page.dart';

import '../../../../core/PolicyView/presentation/policy_view.dart';
import '../bloc/search_policy_bloc.dart';

class PolicyViewPage extends StatelessWidget {
  static const String id = 'policy_view_page';
  const PolicyViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFontSize = screenWidth / 17;
    double buttonFontSize = screenWidth / 23;
    return Scaffold(
      body: BlocBuilder<SearchPolicyBloc, SearchPolicyState>(
          builder: (context, state) {
            if(state is PolicyFound){
              return  SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PolicyView(policyData: state.policyViewData,),
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, MainPage.id);
                            context.read<SearchPolicyBloc>().add(ExitPolicyView());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Main Menu',
                              style: TextStyle(
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else if( state is PolicyNotFound){
              return SizedBox(
                width: screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Policy Not Found',
                      style: TextStyle(
                        fontSize: textFontSize,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, MainPage.id);
                          context.read<SearchPolicyBloc>().add(ExitPolicyView());
                        },
                        child: Text(
                          'Main Menu',
                          style: TextStyle(
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
      Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //PolicyView()
            ],
          ),
        ),
      ),
    );
  }
}
