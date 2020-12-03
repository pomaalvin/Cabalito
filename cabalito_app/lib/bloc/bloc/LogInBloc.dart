import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';

class LogInBloc extends Bloc<LogInBlocEvent,LogInBlocState>{
  @override
  LogInBlocState get initialState => InitLoginState();

  @override
  Stream<LogInBlocState> mapEventToState(LogInBlocEvent event) async* {
      if(event is LogInEvent){
        yield LogInLoadingState();
        await Future.delayed(Duration(seconds: 3));
        yield LogInOkState();
      }
  }
}