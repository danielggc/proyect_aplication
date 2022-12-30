import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class   BackgroundLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child:
           Container(
            decoration: boxDecoration(),
            child:  Container(
              constraints: BoxConstraints(maxWidth: 200),
              child: Center(

                child: Padding(
                  child: Image(
                    image: AssetImage('pokebola.png'),
                    width: 150,  
                    ),

                  padding: const EdgeInsets.symmetric( horizontal: 30 ),
              ),)
            ),
           )

          );

  }

  BoxDecoration boxDecoration(){
    return BoxDecoration(
              image: DecorationImage(
                image: AssetImage('fond.jpg'),
                fit :BoxFit.fill,
              )
            );
  }
}