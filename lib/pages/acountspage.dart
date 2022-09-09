import 'package:flutter/material.dart';

import '../bloc_navigation/navigation_bloc.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  const MyAccountsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Accounts",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),
        ),
    );
  }
}