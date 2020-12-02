import 'package:cabalitoapp/model/ImagePublicatio.dart';
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

abstract class LoginEvent extends Equatable{}
class LoadingEvent extends LogInEvent {
  @override
  List<Object> get props => [];
}
class LogInEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
class LogOutEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}