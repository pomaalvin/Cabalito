import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/Publication.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/model/PublicationView.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:cabalitoapp/screens/Loading.dart';
import 'package:cabalitoapp/screens/LogIn.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/PublicationList.dart';
import 'package:cabalitoapp/screens/RegisterSeller.dart';
import 'package:cabalitoapp/screens/Seller.dart';
import 'package:cabalitoapp/screens/SellerPublicationList.dart';
import 'package:cabalitoapp/screens/SplashScreen.dart';
import 'package:cabalitoapp/screens/Template.dart';
import 'package:cabalitoapp/screens/Template2.dart';
import 'package:cabalitoapp/screens/UpdateSeller.dart';
import 'package:equatable/equatable.dart';

import '../../screens/ViewPublication.dart';

abstract class NavigationState extends Equatable{
  const NavigationState();
}
class LoadingPageState extends NavigationState{
  String title;
  String subtitle;
  LoadingPageState(this.title,this.subtitle);
  @override
  List<Object> get props => [title,subtitle,Loading()];
}
class SplashScreenState1 extends NavigationState{
  const SplashScreenState1();
  @override
  List<Object> get props => ["Loading",null,SplashScreenView()];
}
class LogInState extends NavigationState{
  const LogInState();
  @override
  List<Object> get props => ["Loading",null,LogIn()];
}
class InitPageState extends NavigationState{
  const InitPageState();
  @override
  List<Object> get props => ["Home",null,Template()];
}
class HomePageState extends NavigationState{
  const HomePageState();
  @override
  List<Object> get props => ["Home",null,Template2()];
}
class AddPublicationPageState extends NavigationState{
  List<Color> colors;
  List<City> cities;
  List<Brand> brands;
  bool modify;
  Publication publication;
  AddPublicationPageState(this.colors,this.brands,this.cities,this.modify,this.publication);
  @override
  List<Object> get props => ["Mis Publicaciones",modify?"Modificar":"Agregar",AddPublication(colors,brands,cities,modify,publication)];
}
class PublicationPageState extends NavigationState{
  PublicationPageState();
  @override
  List<Object> get props => ["Publication"];
}
class PublicationViewState extends NavigationState{
  List<PublicationView> publicationsView;
  PublicationViewState(this.publicationsView);
  @override
  List<Object> get props => ["Publication","Ver",PublicationsView(publicationsView)];
}
class PublicationListState extends NavigationState{
  List<ListPublication> listPublication;
  List<Color> colors;
  List<City> cities;
  List<Brand> brands;
  Color newColor;
  int numPue;
  Brand newBrand;
  City newCity;
  PublicationListState(this.listPublication,this.colors,this.brands,this.cities,this.newColor,this.newCity,this.newBrand,this.numPue);
  @override
  List<Object> get props => ["Publicacion",null,PublicationList(listPublication,colors,brands,cities,newColor,newCity,newBrand,numPue)];

}
class SellerPublicationListState extends NavigationState{
  List<ListPublication> listPublication;
  SellerPublicationListState(this.listPublication);
  @override
  List<Object> get props => ["Mis Publicaciones",null,SellerPublicationList(listPublication)];
}
class MechanicPageState extends NavigationState{
  List<Mechanic> mechList;
  MechanicPageState(this.mechList);
  @override
  List<Object> get props => ["Mecánicos",null,MechanicList(this.mechList)];
}
class ViewSellerPageState extends NavigationState{
  Seller seller;
  ViewSellerPageState(this.seller);
  @override
  List<Object> get props => ["Usuario",null,ViewSeller(this.seller)];
}
class RegisterSellerPageState extends NavigationState{
  const RegisterSellerPageState();
  @override
  List<Object> get props => ["Registro",null,RegisterSeller()];
}
class UpdateSellerPageState extends NavigationState{
  Seller seller;
  UpdateSellerPageState(this.seller);
  @override
  List<Object> get props => ["Usuario","modificar",UpdateSeller(this.seller)];
}
class AddSellerPageState extends NavigationState{
  const AddSellerPageState();
  @override
  List<Object> get props => ["Usuario","Registro",RegisterSeller()];
}
class PublicationSearchState extends NavigationState{
  List<ListPublication> listPublication;
  List<Color> colors;
  List<City> cities;
  List<Brand> brands;

  Color newColor;
  int numPue;
  Brand newBrand;
  City newCity;
  PublicationSearchState(this.listPublication,this.colors,this.brands,this.cities,this.newColor,this.newCity,this.newBrand,this.numPue);
  @override
  List<Object> get props => ["Publicacion",null,PublicationList(listPublication,colors,brands,cities,newColor,newCity,newBrand,numPue)];
}




