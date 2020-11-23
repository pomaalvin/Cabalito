import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  PublicationRepository _publicationRepository;
  NavigationBloc(this._publicationRepository);
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
    else if(event is AddPublicationPageEvent){
      yield LoadingPageState();
      yield AddPublicationPageState();
    }
    else if(event is PublicationViewEvent){
      yield LoadingPageState();
      yield PublicationViewState();
    }
    else if(event is PublicationListEvent){
      yield LoadingPageState();
      yield PublicationListState();
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
    else if(event is UpdateSellerPageEvent){
      yield LoadingPageState();
      yield UpdateSellerPageState();
    }

    else if(event is AddPublicationEvent){
      //yield LoadingPageState();
      bool estado=await _publicationRepository.addPublication(event.publication);
      /*if(estado){
        yield HomePageState();
      }
      else{
      }*/
    }
  }


}