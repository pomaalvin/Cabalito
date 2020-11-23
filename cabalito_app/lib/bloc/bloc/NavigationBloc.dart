import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/model/PublicationView.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import 'package:cabalitoapp/screens/PublicationList.dart';
import "../../model/Color.dart";
import 'package:cabalitoapp/repository/SellerRepository.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  PublicationRepository _publicationRepository;
  SellerRepository _sellerRepository;
  NavigationBloc(this._publicationRepository,this._sellerRepository);
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
    else if(event is UpdateSellerPageEvent){
      yield LoadingPageState();
      yield UpdateSellerPageState();
    }
    else if(event is AddPublicationPageEvent){
      yield LoadingPageState();
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();

      yield AddPublicationPageState(colors,brands,cities);
    }
    else if(event is AddPublicationEvent){
      yield LoadingPageState();
      bool estado=await _publicationRepository.addPublication(event.publication,event.images);
      print(estado);
      if(estado){
        yield HomePageState();
      }
      else{
        yield HomePageState();
      }
    }
    else if(event is PublicationListsEvent){
      yield LoadingPageState();
      List<ListPublication> publicationLists=await _publicationRepository.getpublicationLists();
      yield PublicationListState(publicationLists);
      /*if(estado){

      }
      else{
      }*/
    }

    else if(event is PublicationViewEvent){
      yield LoadingPageState();
      List<PublicationView> publicationsViews=await  _publicationRepository.getpublicationView(event.idPublication);
      List<ListPublication> publicationsPaths=await  _publicationRepository.getpublicationPaths(event.idPublication);
      yield PublicationViewState(publicationsViews,publicationsPaths);
    }
  }


}