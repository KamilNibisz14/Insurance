part of 'search_policy_bloc.dart';

abstract class SearchPolicyState extends Equatable {
  const SearchPolicyState();
  
  @override
  List<Object> get props => [];
}

class SearchPolicyInitial extends SearchPolicyState {}

class PolicyNotFound extends SearchPolicyState{}


// ignore: must_be_immutable
class PolicyFound extends SearchPolicyState{
  PolicyViewData policyViewData;
  PolicyFound({
    required this.policyViewData
  });
  @override
  List<Object> get props => [policyViewData];
}