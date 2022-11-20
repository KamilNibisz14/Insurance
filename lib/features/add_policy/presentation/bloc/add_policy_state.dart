part of 'add_policy_bloc.dart';

abstract class AddPolicyState extends Equatable {
  const AddPolicyState();
  
  @override
  List<Object> get props => [];
}

class AddPolicyInitial extends AddPolicyState {}
class FillPolicyState extends AddPolicyState {}

// ignore: must_be_immutable
class PolicyViewState extends AddPolicyState {
  PolicyViewData policyData;
  PolicyViewState({
    required this.policyData
  });
  @override
  List<Object> get props => [policyData];
}