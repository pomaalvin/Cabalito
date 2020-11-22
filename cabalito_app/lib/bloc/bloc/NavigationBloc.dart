import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  @override
  NavigationState get initialState => InitPageState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is HomePageEvent){
      yield LoadingPageState();
      yield HomePageState();
    }
    else if(event is PublicationPageEvent){
      yield LoadingPageState();
      yield PublicationPageState();

    }
    else if(event is MechanicPageEvent){
      yield LoadingPageState();
      yield MechanicPageState();
    }
    else if(event is SellerPageEvent){
      yield LoadingPageState();
      yield SellerPageState();
    }
    else if(event is RegisterSellerPageEvent){
      yield LoadingPageState();
      yield RegisterSellerPageState();
    }
  }


}