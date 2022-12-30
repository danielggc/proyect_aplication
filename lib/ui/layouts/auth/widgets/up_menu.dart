import 'package:flutter/material.dart';
import 'package:proyect_aplication/providers/sidemenu_provider.dart';
import 'package:proyect_aplication/ui/buttons/search_button.dart';
import 'package:proyect_aplication/ui/layouts/auth/widgets/navbar_avatar.dart';
import 'package:proyect_aplication/ui/layouts/auth/widgets/notification_inficator.dart';

class Upmenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wize = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
          children: [
            if( wize.width < 700 )
              IconButton( onPressed: ()=> { SidemenuProvider.openMenu() }, icon: Icon( Icons.menu_outlined ) ),

            SizedBox( width:  5,),
            if( wize.width >= 390 )
              SearchButton(), 
            Spacer(),
            NotificationInficator(),
            SizedBox(width: 10,),
            NavbarAvatar(),
            SizedBox(width: 20,)
          ],
        ),
        decoration:  boxDecoration(),
       );
  }

  BoxDecoration boxDecoration (){
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5
        )
      ]
    );
  }
}