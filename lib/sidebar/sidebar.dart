import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({ Key? key }) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color:const Color(0xFF262AAA),
          ),
        ),
      ],
    );
  }
}