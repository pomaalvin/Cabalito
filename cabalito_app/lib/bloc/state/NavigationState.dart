import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:cabalitoapp/screens/Loading.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/RegisterSeller.dart';
import 'package:cabalitoapp/screens/Seller.dart';
import 'package:cabalitoapp/screens/Template.dart';
import 'package:cabalitoapp/screens/UpdateSeller.dart';
import 'package:equatable/equatable.dart';

import '../../ViewPublication.dart';

abstract class NavigationState extends Equatable{
  const NavigationState();
}
class LoadingPageState extends NavigationState{
  const LoadingPageState();
  @override
  List<Object> get props => ["Loading",Loading()];
}
class InitPageState extends NavigationState{
  const InitPageState();
  @override
  List<Object> get props => ["Home",Template()];
}
class HomePageState extends NavigationState{
  const HomePageState();
  @override
  List<Object> get props => ["Home",Template()];
}
class AddPublicationPageState extends NavigationState{
  List<Color> colors;
  List<City> cities;
  List<Brand> brands;
  AddPublicationPageState(this.colors,this.brands,this.cities);
  @override
  List<Object> get props => ["Publicacion",AddPublication(colors,brands,cities)];
}
class PublicationPageState extends NavigationState{
  List<Color> colors;
  List<City> cities;
  List<Brand> brands;
  PublicationPageState(this.colors,this.brands,this.cities);
  @override
  List<Object> get props => ["Publication",AddPublication(colors,brands,cities)];
}
class MechanicPageState extends NavigationState{
  const MechanicPageState();
  @override
  List<Object> get props => ["Mechanic",MechanicList()];
}
class SellerPageState extends NavigationState{
  const SellerPageState();
  @override
  List<Object> get props => ["Seller",Seller()];
}
class RegisterSellerPageState extends NavigationState{
  const RegisterSellerPageState();
  @override
  List<Object> get props => ["RegisterSeller",RegisterSeller()];
}
class UpdateSellerPageState extends NavigationState{
  const UpdateSellerPageState();
  @override
  List<Object> get props => ["UpdateSeller",UpdateSeller()];
}