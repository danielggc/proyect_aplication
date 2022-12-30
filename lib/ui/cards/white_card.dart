import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final Widget  child;
  final String? title;
  final double? width;
  WhiteCard({
    required this.child,
    this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width == null ? null : width ,
      margin: EdgeInsets.all( 8 ),
      padding: EdgeInsets.all( 10 ),
      decoration: boxDecoration(),
      child:  Column(
        children: [
          if( title != null )
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!
                , style:  GoogleFonts.roboto(
                   fontSize : 15,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   decoration: TextDecoration.none
                  )
                
              ),
            ),
            Divider(),
            child,

        ],)
    );
    
  }
  BoxDecoration boxDecoration (){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color:Colors.black.withOpacity( 1  ) ,
          blurRadius: 5
        )
      ]

    );
  }
}