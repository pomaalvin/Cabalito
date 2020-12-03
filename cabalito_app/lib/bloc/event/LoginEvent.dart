
import 'package:cabalitoapp/model/LoginRequest.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:equatable/equatable.dart';

abstract class LogInBlocEvent extends Equatable{}
class LoadingEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class InitAppEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class SignOutEvent extends LogInBlocEvent {
  SignOutEvent();
  @override
  List<Object> get props => [];
}
class LogInEvent extends LogInBlocEvent {
  LoginRequest loginRequest;
  LogInEvent(this.loginRequest);
  @override
  List<Object> get props => [loginRequest];
}
class LogInPageEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class LogOutEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class SignUpPageEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class SignUpEvent extends LogInBlocEvent {
  Seller seller;
  LoginRequest loginRequest;
  SignUpEvent(this.seller,this.loginRequest);
  @override
  List<Object> get props => [seller,loginRequest];
}