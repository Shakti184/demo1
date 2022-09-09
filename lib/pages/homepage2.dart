import 'package:demo1/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with NavigationStates {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "HomePage",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),
        ),
    );
  }
}