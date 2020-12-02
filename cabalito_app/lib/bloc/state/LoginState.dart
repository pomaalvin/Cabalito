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

abstract class LoginState extends Equatable{
  const LoginState();
}
class InitState extends LoginState{
  InitState();
  @override
  List<Object> get props => [];
}

class LogInOkState extends LoginState{
  LogInOkState();
  @override
  List<Object> get props => [];
}

class LogInFailedState extends LoginState{
  LogInFailedState();
  @override
  List<Object> get props => [];
}
class SignUpState extends LoginState{
  SignUpState();
  @override
  List<Object> get props=>[];
}




