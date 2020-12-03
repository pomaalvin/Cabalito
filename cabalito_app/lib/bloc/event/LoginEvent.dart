
import 'package:equatable/equatable.dart';

abstract class LogInBlocEvent extends Equatable{}
class LoadingEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class LogInEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}
class LogOutEvent extends LogInBlocEvent {
  @override
  List<Object> get props => [];
}