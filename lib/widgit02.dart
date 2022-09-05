import 'package:flutter/material.dart';

class Widget02 extends StatelessWidget {
  const Widget02({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AboutListTile(
        icon: Icon(Icons.info),
        applicationIcon: FlutterLogo(),
        applicationLegalese: 'Legalese',
        applicationName: 'Flutter App',
        applicationVersion: 'version 1.0.0',
        aboutBoxChildren: [
          Text("This is a text created by Shakti "),
        ],
      ),
    );
  }
}