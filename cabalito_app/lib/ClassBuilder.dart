import 'file:///G:/Universidad/Semestre%206/Ingenieria%20de%20Software/Proyecto/Cabalito/cabalito_app/lib/screens/Home.dart';


typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor){
  _constructors[T.toString()] = constructor;
}

class ClassBuilder{
  static void registerClasses(){
    register<Home>(() => Home());
  }
  static dynamic fromString(String type){
    return _constructors[type]();

  }
}