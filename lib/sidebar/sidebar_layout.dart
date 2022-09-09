import 'package:demo1/pages/homepage2.dart';
import 'package:demo1/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_navigation/navigation_bloc.dart';


class SidebarLayout extends StatelessWidget {
  const SidebarLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create:(context)=>NavigationBloc(const HomePage()),
        child:Stack(
          children:  <Widget>[
            BlocBuilder<NavigationBloc,NavigationStates>(
              builder: ((context, navigationState) => navigationState as Widget),
            ),
            const Sidebar(),
          ],
        ),
      ),
    );
  }
}