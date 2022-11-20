part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class InitialState extends LoginState{}
class LoginAgentState extends LoginState {

  bool isLogged;
  LoginAgentState({required this.isLogged});
  List<Object> get props => [isLogged];

}
class ErrorState extends LoginState{}
class ValidState extends LoginState{}