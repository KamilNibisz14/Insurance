part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class EnableToGoNextPageEvent extends NavigationEvent{}

class UnenableToGoNextPageEvent extends NavigationEvent{}
