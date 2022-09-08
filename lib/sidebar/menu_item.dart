import 'package:flutter/material.dart';
class Menuitem extends StatelessWidget {
  const Menuitem({ Key? key, required this.icon, required this.title }) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.cyan,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(title,
          style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 26,color: Colors.white),)
        ],
      ),
    );
  }
}