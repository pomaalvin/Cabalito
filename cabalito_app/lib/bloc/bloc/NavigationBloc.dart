import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/Publication.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:cabalitoapp/repository/MechanicRepository.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
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
      yield LoadingPageState("Home",null);
      yield HomePageState();
    }
    else if(event is PublicationPageEvent){
      yield LoadingPageState("Home",null);
      yield PublicationPageState();
    }
    else if(event is MechanicPageEvent){
      yield LoadingPageState("Mechanic",null);
      List<Mechanic> mechanic=await _mechanicRepository.getMechanic();
      yield MechanicPageState(mechanic);
    }
    else if(event is SplashScreenEvent){
      yield SplashScreenState1();
    }
    else if(event is InformationEvent){
      yield InformationState();
    }
    else if(event is LogInEvent){
      yield LogInState();
    }
    else if(event is AddQualificationEvent){
      yield LoadingPageState("Mechanic","Agregar");
      bool estado=await _mechanicRepository.addQualification(event.stars);
      if(estado){
        List<Mechanic> mechanic=await _mechanicRepository.getMechanic();
        yield MechanicPageState(mechanic);
      }
      else{
        yield HomePageState();
      }
    }
    else if(event is UpdateSellerPageEvent){
      yield LoadingPageState("Usuario","Modificar");
      Seller seller =new Seller();
      try{
        seller=await _sellerRepository.getSeller();
        yield  UpdateSellerPageState(seller);
      }catch(e){
        print(e);
      }

    }
    else if(event is UpdateSellerEvent){
      yield LoadingPageState("Usuario","Modificar");
      try{
        bool estado=await _sellerRepository.updateSeller(event.seller,event.imageFile,event.flag);
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
      yield LoadingPageState("Usuario","Registro");
      yield RegisterSellerPageState();
    }

    else if(event is AddPublicationPageEvent){
      yield LoadingPageState("Mis Publicaciones","Agregar");
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();

      yield AddPublicationPageState(colors,brands,cities,false,null);
    }
    else if(event is AddPublicationEvent){
      yield LoadingPageState("Mis Publicaciones","Agregar");
      bool estado=await _publicationRepository.addPublication(event.publication,event.images);
      print(estado);
      if(estado){
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
      else{
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
    }
    else if(event is ModifyPublicationEvent){
      yield LoadingPageState("Mis Publicaciones","Modificar");
      bool estado=await _publicationRepository.modifyPublication(event.publication,event.images,event.imagesDelete);
      print(estado);
      if(estado){
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
    else{
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
    }
    else if(event is DeletePublicationEvent){
      yield LoadingPageState("Mis Publicaciones","Agregar");
      bool estado=await _publicationRepository.deletePublication(event.idPublication);
      if(estado){
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
      else{
        List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
        yield SellerPublicationListState(publicationLists);
      }
    }
    else if(event is SellerPublicationEvent){
      yield LoadingPageState("Mis Publicaciones",null);
      List<ListPublication> publicationLists=await _publicationRepository.getSellerPublicationList(0);
      yield SellerPublicationListState(publicationLists);
    }
    else if(event is PublicationListsEvent){
      yield LoadingPageState("Publicaciones",null);
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();
      Color newColor;
      int numPue;
      Brand newBrand;
      City newCity;
      List<ListPublication> publicationLists=await _publicationRepository.getpublicationLists(0);
      yield PublicationListState(publicationLists,colors,brands,cities,newColor,newCity,newBrand,numPue);
      /*if(estado){

      }
      else{
      }*/
    }

    else if(event is PublicationViewEvent){
      yield LoadingPageState("Publicaciones","Ver");
      List<PublicationView> publicationsViews=await  _publicationRepository.getpublicationView(event.idPublication);
      yield PublicationViewState(publicationsViews);
    }
    else if(event is SellerPublicationViewEvent){
      yield LoadingPageState("Mis Publicaciones","Modificar");
      Publication publicationEdit=await  _publicationRepository.getpublicationEdit(event.idPublication);
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();

      yield AddPublicationPageState(colors,brands,cities,true,publicationEdit);
    }
    else if(event is PublicationSearchEvent){
      yield LoadingPageState("Publicaciones",null);
      List<Color> colors=await  _publicationRepository.getColors();
      List<City> cities=await  _publicationRepository.getCities();
      List<Brand> brands=await  _publicationRepository.getBrands();
      List<ListPublication> publicationsSearchLists=await  _publicationRepository.getpublicationSearch(event.newCity,event.newColor,event.newBrand,event.numPuertas,event.search,event.page);
      yield PublicationSearchState(publicationsSearchLists,colors,brands,cities,event.newColor,event.newCity,event.newBrand,event.numPuertas);
    }
  }
}