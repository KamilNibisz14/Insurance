import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/features/search_policy/presentation/bloc/search_policy_bloc.dart';
import 'package:insurance/features/search_policy/presentation/pages/policy_view_page.dart';

import '../navigation/search_policy_navigation_bloc.dart';
import '../widgets/searchPolicyTextFieldForm.dart';

class SearchPolicyPage extends StatelessWidget {
  static const String id = 'search_policy_page';
  const SearchPolicyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String policyID = '';
    return Scaffold(
      body: Center(
        child: SearchPolicyTextFieldForm(
          getData: (value) {
            policyID = value;
          },
        ),
      ),
      floatingActionButton: BlocBuilder<SearchPolicyNavigationBloc, SearchPolicyNavigationState>(
        builder: (context, state) {
          if(state is EnableToGoNextPageState){
            return FloatingActionButton(
              child: const Icon(
                Icons.search,
              ),
              onPressed: () {
                context.read<SearchPolicyBloc>().add(SearchPolicyInDatabase(policyID: policyID));
                context.read<SearchPolicyNavigationBloc>().add(UnenableToGoNextPageEvent());
                Navigator.pushNamed(context, PolicyViewPage.id);
              },
            );
          } else {
             return FloatingActionButton(
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            );
          }
        },
      ),
    );
  }
}
