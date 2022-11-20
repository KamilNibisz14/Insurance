part of 'search_policy_navigation_bloc.dart';

abstract class SearchPolicyNavigationState extends Equatable {
  const SearchPolicyNavigationState();
  
  @override
  List<Object> get props => [];
}

class SearchPolicyNavigationInitial extends SearchPolicyNavigationState {}

class EnableToGoNextPageState extends SearchPolicyNavigationState {}

class UnenableToGoNextPageState extends SearchPolicyNavigationState {}

