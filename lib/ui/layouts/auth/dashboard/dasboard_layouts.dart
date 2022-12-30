import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_aplication/providers/sidemenu_provider.dart';
import 'package:proyect_aplication/ui/layouts/auth/widgets/up_menu.dart';
import 'package:proyect_aplication/ui/shared/sidebar.dart';
class DasboardLayouts extends StatefulWidget{
    final Widget child;
  DasboardLayouts({required this.child });
  _DasboardLayouts createState() => _DasboardLayouts();
}

class _DasboardLayouts extends State<DasboardLayouts> with SingleTickerProviderStateMixin {
  void initState(){
    SidemenuProvider.menuController = new AnimationController(
      vsync: this ,
      duration: Duration(microseconds: 500)
    );
  }

  @override
  Widget build(BuildContext context) { 
    // TODO: implement build
    final wize = MediaQuery.of(context).size;
    return Stack( 
      children:[
       Row(
        children: [
          if(  wize.width >=700 )
            Sidebar(),
          Expanded(
            child: Column(
              children: [

                Material(child: Upmenu()),
        
                Expanded( child: this.widget.child ),
              ]
            )
          )
          
        ],
      ),
      if( wize.width < 700 )
        AnimatedBuilder(
          animation: SidemenuProvider.menuController,
          builder: ( context, _ )  => Stack(
            children: [
              if( SidemenuProvider.isOpen )
                Opacity(
                  opacity: SidemenuProvider.opacity.value,
                  child: GestureDetector(
                    onTap: () => SidemenuProvider.closeMenu() ,
                    child: Container(
                      width: wize.width,
                      height: wize.height,
                      color: Colors.black26,
                    ),
                   ),
                ),
              Transform.translate(
                offset: Offset( SidemenuProvider.movement.value , 0),
                child: Sidebar(),
              )
            ],
          )
        )      
    ]
  );

  }


}