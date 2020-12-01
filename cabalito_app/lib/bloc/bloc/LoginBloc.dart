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
import 'package:cabalitoapp/screens/SplashScreen.dart';
import "../../model/Color.dart";
import 'package:cabalitoapp/repository/SellerRepository.dart';

class LoginBloc extends Bloc<NavigationEvent,NavigationState>{
  LoginBloc();
  @override
  NavigationState get initialState => InitPageState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {

  }
}