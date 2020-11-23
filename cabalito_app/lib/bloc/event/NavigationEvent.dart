import 'dart:io';

import 'package:cabalitoapp/model/Publication.dart';
import'package:cabalitoapp/model/Publication.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{}
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
  @override
  List<Object> get props => [];
}
class PublicationListEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class MechanicPageEvent extends NavigationEvent {
  @override
  List<Object> get props => [];
}
class SellerPageEvent extends NavigationEvent {
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