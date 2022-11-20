// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insurance/locator.dart';

import '../../domain/entities/login_model.dart';
import '../../domain/usecases/check_if_login_is_correct.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isTextShow = false;
  LoginBloc() : super(InitialState()) {
    on<GetAgentData>(_onGetAgentData);
    on<ErrorTextShowEvent>(_onErrorTextShowEvent);
    on<ErrorTextShowoffEvent>(_onErrorTextShowoffEvent);
  }
  void _onErrorTextShowEvent(ErrorTextShowEvent event, Emitter<LoginState> emit){
    emit(ErrorState());
  }
  void _onErrorTextShowoffEvent(ErrorTextShowoffEvent event, Emitter<LoginState> emit){
    emit(ValidState());
  }
}

void _onGetAgentData(GetAgentData event, Emitter<LoginState> emit)async{
  event.loginData;
  bool isLogged;
  isLogged = await locator.get<CheckLogin>().ckeckIfLoginIsValid(event.loginData);
  emit(LoginAgentState(isLogged: isLogged));
}