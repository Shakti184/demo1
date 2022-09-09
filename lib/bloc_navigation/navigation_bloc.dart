

import 'package:bloc/bloc.dart';
import 'package:demo1/pages/acountspage.dart';
import 'package:demo1/pages/myorderspage.dart';

import '../pages/homepage2.dart';

enum NavigationEvents{
  // ignore: constant_identifier_names
  HomePageClickEvent,
  // ignore: constant_identifier_names
  MyAccountClickEvent,
  // ignore: constant_identifier_names
  MyOrdersClickEvent,
}

abstract class NavigationStates {}
class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  NavigationBloc(NavigationStates initialState) : super(initialState);


  HomePage get initialState=>const HomePage();

  get yield => null;
  Stream<NavigationStates>?mapEventToState(NavigationEvents event){
    switch (event){
      case NavigationEvents.HomePageClickEvent: 
         const HomePage();
      break;
      case NavigationEvents.MyAccountClickEvent:
        const MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickEvent:
         const MyOrdersPage();
        break;
    }
    return null;
  }
}