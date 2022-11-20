part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetAgentData extends LoginEvent{
  LoginData loginData;
  GetAgentData({required this.loginData});
  @override
  List<Object> get props => [loginData];
}
class ErrorTextShowEvent extends LoginEvent{}
class ErrorTextShowoffEvent extends LoginEvent{}
