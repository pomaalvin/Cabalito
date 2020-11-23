import 'package:cabalitoapp/screens/AddPublication.dart';
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
  List<Object> get props => [];
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
  const AddPublicationPageState();
  @override
  List<Object> get props => ["Publicacion",AddPublication()];
}
class PublicationPageState extends NavigationState{
  const PublicationPageState();
  @override
  List<Object> get props => ["Publication",AddPublication()];
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