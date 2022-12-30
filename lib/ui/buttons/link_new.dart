 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkNew extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child:  OutlinedButton(
    child: Text('dgc7.com'),
    onPressed: () {
      print('Pressed');
    },
  ),);
  }
}