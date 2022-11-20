part of 'search_policy_navigation_bloc.dart';

abstract class SearchPolicyNavigationEvent extends Equatable {
  const SearchPolicyNavigationEvent();

  @override
  List<Object> get props => [];
}
class EnableToGoNextPageEvent extends SearchPolicyNavigationEvent{}

class UnenableToGoNextPageEvent extends SearchPolicyNavigationEvent{}
