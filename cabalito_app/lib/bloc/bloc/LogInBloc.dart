import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';
import 'package:cabalitoapp/lib/Alerts.dart';
import 'package:cabalitoapp/lib/token.dart';
import 'package:cabalitoapp/repository/SellerRepository.dart';
import 'package:cabalitoapp/screensLogin/SignUp.dart';

class LogInBloc extends Bloc<LogInBlocEvent,LogInBlocState>{
  SellerRepository sellerRepository;
  LogInBloc(this.sellerRepository);
  @override
  LogInBlocState get initialState => InitLoginState();

  @override
  Stream<LogInBlocState> mapEventToState(LogInBlocEvent event) async* {
    if(event is InitAppEvent){
      yield InitLoginState();
      await Future.delayed(Duration(seconds: 2));
      yield LogInFailedState();
    }
    if(event is SignOutEvent){
      yield InitLoginState();
      await Token().delToken();
      yield LogInFailedState();
    }
    else  if(event is LogInEvent){
        yield LogInLoadingState();
        await Future.delayed(Duration(seconds: 1));
        bool res=await sellerRepository.signin(event.loginRequest);
        if(!res){
          alertErrorOut("Usuario o contraseña incorrecto.");
          yield LogInFailedState();
        }
        else{
          yield LogInOkState();
        }
      }
     else if(event is SignUpPageEvent){
        yield SignUpState();
      }
    else if(event is LogInPageEvent){
        yield LogInFailedState();
      }
    else if(event is SignUpEvent){
        yield SignUpLoadingState();
        await Future.delayed(Duration(seconds: 1));
        bool res=await sellerRepository.signup(event.seller,event.loginRequest);
        if(res){
          alertOk("Se registro correctamente");
          yield LogInFailedState();
        }
        else{
          alertErrorOut("No se pudo registrar al usuario");
          yield SignUpState();
        }

      }
  }

}