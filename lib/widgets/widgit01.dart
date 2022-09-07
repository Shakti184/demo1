
import 'package:flutter/material.dart';

class Widget01 extends StatelessWidget {
  const Widget01({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AboutListTile(
        icon: Icon(Icons.info),
        applicationIcon: FlutterLogo(),
        applicationLegalese: 'Legalese',
        applicationVersion: 'Version 1.0.0',
        applicationName: 'Flutter App',
        aboutBoxChildren: [
          Text('THIS is created by SHAKTI'),
        ],
      ),
    );
  }
}