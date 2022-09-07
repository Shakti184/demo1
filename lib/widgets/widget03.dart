
import 'package:flutter/material.dart';

class Widget03 extends StatelessWidget {
  const Widget03({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children:<Widget> [
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed:(){},
              child: null,
              ),
          ),
          SizedBox(
            width: 100.0,
            height: 200.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 115, 200, 243),
              ),
              onPressed:(){},
              child: null,
              ),
          )
        ],
      ),
    );
  }
}