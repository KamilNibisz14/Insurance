import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_policy_navigation_event.dart';
part 'search_policy_navigation_state.dart';

class SearchPolicyNavigationBloc extends Bloc<SearchPolicyNavigationEvent, SearchPolicyNavigationState> {
  SearchPolicyNavigationBloc() : super(SearchPolicyNavigationInitial()) {
    on<SearchPolicyNavigationEvent>((event, emit) {
        if(event is EnableToGoNextPageEvent){
        emit(EnableToGoNextPageState());
      }
      if(event is UnenableToGoNextPageEvent){
        emit(UnenableToGoNextPageState());
      }
    });
  }
}
