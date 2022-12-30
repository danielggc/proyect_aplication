import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
         child: Column(children: [
          CircularProgressIndicator(),
         ],)
      ),
    );
  }
}