import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:cabalitoapp/repository/MechanicRepository.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/model/PublicationView.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import "../../model/Color.dart";
import 'package:cabalitoapp/repository/SellerRepository.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  PublicationRepository _publicationRepository;
  MechanicRepository _mechanicRepository;
  SellerRepository _sellerRepository;
  NavigationBloc(this._publicationRepository,this._mechanicRepository,this._sellerRepository);
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
      List<Mechanic> mechanic=await _mechanicRepository.getMechanic();
      yield MechanicPageState(mechanic);
    }
    else if(event is AddQualificationEvent){
      yield LoadingPageState();
      bool estado=await _mechanicRepository.addQualification(event.stars);
      if(estado){
        List<Mechanic> mechanic=await _mechanicRepository.getMechanic();
        yield MechanicPageState(mechanic);
      }
      else{
        yield HomePageState();
      }
    }
    else if(event is ViewSellerPageEvent){
      yield LoadingPageState();
      Seller seller =new Seller();
      try{
        seller=await _sellerRepository.getSeller();
        yield ViewSellerPageState(seller);
      }catch(e){
        print(e);
      }
    }
    else if(event is UpdateSellerPageEvent){
      yield LoadingPageState();
      Seller seller =new Seller();
      try{
        seller=await _sellerRepository.getSeller();
        yield  UpdateSellerPageState(seller);
      }catch(e){
        print(e);
      }

    }
    else if(event is UpdateSellerEvent){
      yield LoadingPageState();
      try{
        bool estado=await _sellerRepository.updateSeller(event.seller,event.imageFile);
        if(estado){
          Seller seller =new Seller();
          seller=await _sellerRepository.getSeller();
          yield  UpdateSellerPageState(seller);
        }
      }catch(e){
        print(e);
      }
    }
    else if(event is RegisterSellerPageEvent){
      yield LoadingPageState();
      yield RegisterSellerPageState();
    }

    else if(event is AddPublicationPageEvent){
      yield LoadingPageState();
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();

      yield AddPublicationPageState(colors,brands,cities,false,null);
    }
    else if(event is AddSellerEvent){
      try{
        bool estado=await _sellerRepository.addSeller(event.seller);
        if(estado){
          yield  HomePageState();
        }
      }catch(e){
        print(e);
      }
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
    else if(event is SellerPublicationEvent){
      yield LoadingPageState();
      List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList();
      yield SellerPublicationListState(publicationLists);
    }
    else if(event is PublicationListsEvent){
      yield LoadingPageState();
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();
      List<ListPublication> publicationLists=await _publicationRepository.getpublicationLists();
      yield PublicationListState(publicationLists,colors,brands,cities);
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
    else if(event is SellerPublicationViewEvent){
      yield LoadingPageState();
      List<PublicationView> publicationsViews=await  _publicationRepository.getpublicationView(event.idPublication);
      List<ListPublication> publicationsPaths=await  _publicationRepository.getpublicationPaths(event.idPublication);
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();

      yield AddPublicationPageState(colors,brands,cities,true,publicationsViews[0]);
    }
  }


}