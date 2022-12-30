
import 'package:fluro/fluro.dart';
import 'package:proyect_aplication/router/dach_board_handlers.dart';
import 'package:proyect_aplication/router/admin_handlers.dart';
import 'package:proyect_aplication/router/no_page_found_handler.dart';

class FluroRouters  {

  static final FluroRouter router =  new FluroRouter();

  static String logingRoute     = '/auth/login';
  static String registerRoute   = '/auth/register';
  static String  dachBoard      = '/dachBoard';
  static String  dachBoardIcons = '/dachBoard/icons';
  static String  dachBoard_black= '/dachBoard/black';
  static void configureRoutes (){
    router.define( logingRoute, handler: AdminHandlers.login);
    router.define( registerRoute, handler: AdminHandlers.register);
    router.define( dachBoard , handler: DachBoardHandlers.dachBoard );
    router.define( dachBoardIcons, handler: DachBoardHandlers.Icons );
    router.define( dachBoard_black, handler: DachBoardHandlers.black );
    router.notFoundHandler = NoPageFoundHandler.noPageFound;    

  }

} 