import 'package:demo1/sidebar/sidebar_layout.dart';
// import 'package:demo1/widgets/widget03.dart';
// import 'package:demo1/widgets/widgit01.dart';
// import 'package:demo1/widgets/widgit02.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SidebarLayout(),
          ],
        ),
      ),
    );
  }
}

