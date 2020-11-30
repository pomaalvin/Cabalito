import 'package:cabalitoapp/model/Mechanic.dart';
import 'dart:io';

import 'package:cabalitoapp/model/Publication.dart';
import'package:cabalitoapp/model/Publication.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:cabalitoapp/model/Stars.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/screens/PublicationList.dart';
import 'package:equatable/equatable.dart';
import 'package:cabalitoapp/model/Brand.dart';
import 'package:cabalitoapp/model/City.dart';
import 'package:cabalitoapp/model/Color.dart';

abstract class NavigationEvent extends Equatable{}
class SplashScreenEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class HomePageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class AddPublicationPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class PublicationPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class PublicationViewEvent extends NavigationEvent {
  int idPublication;
  PublicationViewEvent(this.idPublication);

  @override
  List<Object> get props => [idPublication];
}
class PublicationListEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}

class PublicationListsEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class MechanicPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class ViewSellerPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class RegisterSellerPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class UpdateSellerPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class UpdateSellerEvent extends NavigationEvent {
  Seller seller;
  File imageFile;
  bool flag;
  UpdateSellerEvent(this.seller, this.imageFile,this.flag);

  @override
  List<Object> get props => [seller,imageFile];
}
class AddPublicationEvent extends NavigationEvent {
  Publication publication;
  List<File> images;
  AddPublicationEvent(this.publication,this.images);
  @override
  List<Object> get props => [publication,images];
}
class AddSellerEvent extends NavigationEvent {

  Seller seller;
  AddSellerEvent(this.seller);
  @override
  List<Object> get props => [seller];
}
class ShowMechanicEvent extends NavigationEvent{
  Mechanic mechanic;
  ShowMechanicEvent(this.mechanic);
  @override
  List<Object> get props => [mechanic];
}
class AddQualificationEvent extends NavigationEvent {

  Stars stars;
  AddQualificationEvent(this.stars);
  @override
  List<Object> get props => [stars];
}
class SellerPublicationEvent extends NavigationEvent {
  SellerPublicationEvent();
  @override
  List<Object> get props => [];
}
class SellerPublicationViewEvent extends NavigationEvent{
  int idPublication;
  SellerPublicationViewEvent(this.idPublication);
  @override
  List<Object> get props =>[idPublication];
}
class PublicationSearchEvent extends NavigationEvent{
  Color newColor;
  Brand newBrand;
  City newCity;
  int numPuertas;
  String search;
  PublicationSearchEvent(this.newCity,this.newColor,this.newBrand,this.numPuertas,this.search);
  @override
  List<Object> get props =>[newCity,newColor,newBrand,numPuertas,search];
}