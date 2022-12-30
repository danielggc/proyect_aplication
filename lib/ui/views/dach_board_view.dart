 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyect_aplication/providers/auth_provider.dart';
import 'package:proyect_aplication/ui/cards/white_card.dart';
import 'package:proyect_aplication/ui/labels/custom_labels.dart';

class DachBoardView extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Center(
              child: Text(" dach boart view " , style: CustomLabel.h1B,),
            ),
            SizedBox( height:  10 ,),
            WhiteCard(
              title: "responsivo todo !!!! ",
              child: Text('hola  vaedictis')
            )
          ]
        )
      )
    );
    
  }
}