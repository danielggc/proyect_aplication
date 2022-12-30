import 'package:fluro/fluro.dart';
import 'package:proyect_aplication/providers/sidemenu_provider.dart';
import 'package:proyect_aplication/router/router.dart';
import 'package:proyect_aplication/ui/views/dach_board_black_view%20.dart';
import 'package:proyect_aplication/ui/views/dach_board_view.dart';
import 'package:proyect_aplication/ui/views/dashBoard_icons_view.dart';
import 'package:proyect_aplication/ui/views/login.dart';
import 'package:provider/provider.dart';
import 'package:proyect_aplication/providers/auth_provider.dart';

class DachBoardHandlers {

  static Handler  dachBoard = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SidemenuProvider>(context!, listen: false ).reloadroute( FluroRouters.dachBoard ,);
    final authProvider = Provider.of<AuthProvider>(context,listen:  false);
    if( authProvider.stateLogin == StateLogin.notAuthentication )
      {
        return  LoginView() ;
      }
    else{
      return DachBoardView();
    }
  }));


  static Handler  Icons = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SidemenuProvider>(context!, listen:  false ).reloadroute( FluroRouters.dachBoardIcons );
    
    final authProvider = Provider.of<AuthProvider>(context,listen: false );
    if( authProvider.stateLogin == StateLogin.notAuthentication )
      {
        return  LoginView() ;
      }
    else{
      return dashBoardIconsView();
    }
  }));

  static Handler  black = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SidemenuProvider>(context!, listen:  false ).reloadroute( FluroRouters.dachBoard_black );
    final authProvider = Provider.of<AuthProvider>(context,listen: false );
    if( authProvider.stateLogin == StateLogin.notAuthentication )
      {
        return  LoginView() ;
      }
    else{
      return DachBoardBlackView();
    }
  }));
}