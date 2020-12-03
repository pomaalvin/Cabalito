
import 'package:equatable/equatable.dart';


abstract class LogInBlocState extends Equatable{
  const LogInBlocState();
}
class InitLoginState extends LogInBlocState{
  InitLoginState();
  @override
  List<Object> get props => [];
}

class LogInOkState extends LogInBlocState{
  LogInOkState();
  @override
  List<Object> get props => [];
}
class LogInLoadingState extends LogInBlocState{
  LogInLoadingState();
  @override
  List<Object> get props => [];
}
class LogInFailedState extends LogInBlocState{
  LogInFailedState();
  @override
  List<Object> get props => [];
}
class SignUpState extends LogInBlocState{
  SignUpState();
  @override
  List<Object> get props=>[];
}
class SignUpLoadingState extends LogInBlocState{
  SignUpLoadingState();
  @override
  List<Object> get props=>[];
}




