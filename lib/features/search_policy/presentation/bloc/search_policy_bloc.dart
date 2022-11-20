import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insurance/core/PolicyView/domain/entities/policy_view_data.dart';
import 'package:insurance/locator.dart';

import '../../data/repository/get_policy_data.dart';

part 'search_policy_event.dart';
part 'search_policy_state.dart';

class SearchPolicyBloc extends Bloc<SearchPolicyEvent, SearchPolicyState> {
  SearchPolicyBloc() : super(SearchPolicyInitial()) {
    on<SearchPolicyEvent>((event, emit) {
    });
    on<ExitPolicyView>(_onExitPolicyView);
    on<SearchPolicyInDatabase>(_onSearchPolicyInDatabase);
  }
  _onSearchPolicyInDatabase(SearchPolicyInDatabase event, Emitter<SearchPolicyState> emit)async{
    String policyID = event.policyID;
    if(await locator.get<GetPolicyDataFromRepository>().checkIfDocumentExist(policyID)){

      PolicyViewData policyViewData = await locator.get<GetPolicyDataFromRepository>().getPolicyDocument(policyID);
      emit(PolicyFound(policyViewData: policyViewData));
    }
    else{
      emit(PolicyNotFound());
    }
  }
  _onExitPolicyView(ExitPolicyView event, Emitter<SearchPolicyState> emit){
    emit(SearchPolicyInitial());
  }
}
