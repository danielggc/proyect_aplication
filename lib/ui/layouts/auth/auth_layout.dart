import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyect_aplication/ui/buttons/link_text.dart';
import 'package:proyect_aplication/ui/layouts/auth/widgets/background_login.dart';

class AuthLayout extends StatelessWidget {
  Widget child ;
  AuthLayout({ required this.child });
  @override
  Widget build(BuildContext context) {
    final wize = MediaQuery.of(context).size;
    return Scaffold( body: ListView(
      children: [ 
        Container(
          width: wize.width,
          height: wize.height * 0.95,
          child: Row(
            children: [
              BackgroundLogin(),
              Container(
                width: 900,
                height: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    CustomTitle(),
                    Expanded(child: child),
                  ],
                ),
              ),
          ]),
        ),
        ListLinks( wize.height * 0.05 ),
      ]
    ));
  }
 Widget CustomTitle( ){
  return Container(
    child: Column(
      children: [
        Image.asset('pokebola.png',width: 100, height: 100 , ),
        Text(" pokemon landia " , style:   GoogleFonts.aclonica( fontSize:  20 , color:Colors.white ),),        
      ]
      ),
  );
 }
 
 Widget ListLinks( double altura ){
  return Container(
    color: Colors.black,
    height: altura,
    width: double.infinity,
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          LinkText(nameLink: "about"),
          LinkText(nameLink: "name"),
          LinkText(nameLink: "alalla"),
          LinkText(nameLink: "ajajjajjaksadsk"),
        ],
      ),
  );
 }
}