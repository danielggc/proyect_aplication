import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_aplication/providers/sidemenu_provider.dart';
import 'package:proyect_aplication/router/router.dart';
import 'package:proyect_aplication/ui/shared/Logo_menu_bar.dart';
import 'package:proyect_aplication/ui/shared/custom_menu_item.dart';
import 'package:proyect_aplication/ui/shared/text_separator.dart';
import 'package:proyect_aplication/services/custom_navigation_service.dart';
import 'package:proyect_aplication/services/locator.dart';
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final  providerSideMenu =  Provider.of<SidemenuProvider>(context, listen: true );
    // TODO: implement build
    return Container(
      decoration: boxDecoration() ,
      width: 300,
      height: double.infinity,
      child:ListView(
        children: [

          LogoMenuBar(),

          SizedBox(height: 50 ,),

          TextSeparator(text: 'main'),
          
          CustomMenuItem( 
            text:'dashBoard',
            isActive: providerSideMenu.routeState == FluroRouters.dachBoard ,
            iconData: Icons.compass_calibration_outlined,
            onPressed:  ( ) =>  onPressed( FluroRouters.dachBoard ),),
          CustomMenuItem( 
            text:'analytic',
            isActive: false,
            iconData: Icons.show_chart_outlined,
            onPressed: () => print("hola1"),
          ),
          CustomMenuItem( 
            text:'categories',
            isActive: false,
            iconData: Icons.layers_outlined,
            onPressed: () => print("hola2"),
          ),
          CustomMenuItem( 
            text:'roducts',
            isActive: false,
            iconData: Icons.dashboard_outlined,
            onPressed: () => print("hola3"),
          ),
          CustomMenuItem( 
            text:'discount',
            isActive: false,
            iconData: Icons.attach_money_outlined,
            onPressed: () => print("hola5"),
          ),
          CustomMenuItem( 
            text:'customers',
            isActive: false,
            iconData: Icons.people_alt_outlined,
            onPressed: () => print("hola"),
          ),

          SizedBox(height: 30 ,),

          TextSeparator(text: 'UI ELements'),
                    
          CustomMenuItem( 
            text:'ICons',
            isActive: providerSideMenu.routeState == FluroRouters.dachBoardIcons ,
            iconData: Icons.list_alt_outlined,
            onPressed: () => onPressed( FluroRouters.dachBoardIcons )
            
          ),
          CustomMenuItem( 
            text:'marketin',
            isActive: false,
            iconData: Icons.mark_email_unread_outlined,
            onPressed: () => print("hola"),
          ),
          CustomMenuItem( 
            text:'campaing',
            isActive: false,
            iconData: Icons.note_add_outlined,
            onPressed: () => print("hola"),
          ),
          CustomMenuItem( 
            text:'black',
            isActive: providerSideMenu.routeState == FluroRouters.dachBoard_black,
            iconData: Icons.post_add_outlined,
            onPressed: () => onPressed( FluroRouters.dachBoard_black),
          ),

          SizedBox(height: 30 ,),

          TextSeparator(text: 'exit'),
               
          CustomMenuItem( 
            text:'lagout',
            isActive: false,
            iconData: Icons.exit_to_app_outlined,
            onPressed: () => print("hola"),
          ),

          
        ]
      )
    );
    
  }

  void onPressed( String routeName ){
    SidemenuProvider.closeMenu();
    locator<CustomNavigationService>().navigationTo( routeName );
  }
 
  BoxDecoration boxDecoration(){
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        Color( 0xff092044 ),
        Color( 0xff092030 ),
      ]),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10
        )
      ]
    ) ;   
  }

}