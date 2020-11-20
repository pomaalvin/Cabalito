import 'package:bloc/bloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  @override
  // TODO: implement initialState
  NavigationState get initialState => throw UnimplementedError();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }


}