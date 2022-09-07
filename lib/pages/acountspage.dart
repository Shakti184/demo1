import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

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