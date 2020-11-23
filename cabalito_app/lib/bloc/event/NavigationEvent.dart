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