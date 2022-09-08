import 'package:demo1/pages/homepage2.dart';
import 'package:demo1/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:const <Widget> [
        Sidebar(),
      ],
    );
  }
}