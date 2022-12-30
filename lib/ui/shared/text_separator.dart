import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget{
   final String  text;
  TextSeparator({required this.text });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      margin: EdgeInsets.only( bottom: 5 ),
      child: Text( 
        text, 
        style: GoogleFonts.roboto(
           fontSize: 12 ,
            color: Colors.white.withOpacity(0.5),
            decoration: TextDecoration.none
          ),
        )
    );
  }
}