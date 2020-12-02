
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();
}
class InitState extends LoginState{
  InitState();
  @override
  List<Object> get props => [];
}

class LogInOkState extends LoginState{
  LogInOkState();
  @override
  List<Object> get props => [];
}

class LogInFailedState extends LoginState{
  LogInFailedState();
  @override
  List<Object> get props => [];
}
class SignUpState extends LoginState{
  SignUpState();
  @override
  List<Object> get props=>[];
}




