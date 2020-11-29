import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';
import 'package:cabalitoapp/model/Mechanic.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/model/PublicationView.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:cabalitoapp/screens/Loading.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/PublicationList.dart';
import 'package:cabalitoapp/screens/RegisterSeller.dart';
import 'package:cabalitoapp/screens/Seller.dart';
import 'package:cabalitoapp/screens/Template.dart';
import 'package:cabalitoapp/screens/Template2.dart';
import 'package:cabalitoapp/screens/UpdateSeller.dart';
import 'package:equatable/equatable.dart';

import '../../screens/ViewPublication.dart';

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
  List<Object> get props => ["Home",Template2()];
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
  PublicationPageState();
  @override
  List<Object> get props => ["Publication"];
}
class PublicationViewState extends NavigationState{
  List<PublicationView> publicationsView;
  List<ListPublication> publicationPaths;
  PublicationViewState(this.publicationsView,this.publicationPaths);
  @override
  List<Object> get props => ["Publication",PublicationsView(publicationsView,publicationPaths)];
}
class PublicationListState extends NavigationState{
  List<ListPublication> listPublication;
  PublicationListState(this.listPublication);
  @override
  List<Object> get props => ["Publicacion",PublicationList(listPublication)];
}
class MechanicPageState extends NavigationState{
  List<Mechanic> mechList;
  MechanicPageState(this.mechList);
  @override
  List<Object> get props => ["Mecánicos",MechanicList(this.mechList)];
}
class SellerPageState extends NavigationState{
  const SellerPageState();
  @override
  List<Object> get props => ["Seller",Seller()];
}
class RegisterSellerPageState extends NavigationState{
  const RegisterSellerPageState();
  @override
  List<Object> get props => ["Registro",RegisterSeller()];
}
class UpdateSellerPageState extends NavigationState{
  const UpdateSellerPageState();
  @override
  List<Object> get props => ["UpdateSeller",UpdateSeller()];
}
class AddSellerPageState extends NavigationState{
  const AddSellerPageState();
  @override
  List<Object> get props => ["Registro",RegisterSeller()];
}
