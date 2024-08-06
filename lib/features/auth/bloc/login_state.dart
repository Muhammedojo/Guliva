import 'package:equatable/equatable.dart';
import '../../../core/data/model/login.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  final Login loginResponse;
  const LoginLoaded(this.loginResponse);

  @override
  List<Object> get props => [loginResponse];
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});
  @override
  List<Object> get props => [message];
}
