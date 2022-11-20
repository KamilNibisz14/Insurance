part of 'search_policy_bloc.dart';

abstract class SearchPolicyEvent extends Equatable {
  const SearchPolicyEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SearchPolicyInDatabase extends SearchPolicyEvent{
  String policyID;
  SearchPolicyInDatabase({
    required this.policyID,
  });
  @override
  List<Object> get props => [policyID];
}

class ExitPolicyView extends SearchPolicyEvent{}