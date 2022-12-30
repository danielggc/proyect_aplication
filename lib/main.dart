import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_aplication/providers/auth_provider.dart';
import 'package:proyect_aplication/providers/sidemenu_provider.dart';
import 'package:proyect_aplication/router/router.dart';
import 'package:proyect_aplication/services/local_storage.dart';
import 'package:proyect_aplication/services/locator.dart';
import 'package:proyect_aplication/services/custom_navigation_service.dart';
import 'package:proyect_aplication/ui/layouts/auth/auth_layout.dart';
import 'package:proyect_aplication/ui/layouts/auth/dashboard/dasboard_layouts.dart';
import 'package:proyect_aplication/ui/layouts/splash/splash_layout.dart';
import 'package:proyect_aplication/ui/views/login.dart';
void main() async {
  setupLocator();
  FluroRouters.configureRoutes();
  await LocalStorage.configurePreferences();
  runApp( AppState() );
}


class AppState  extends StatelessWidget{
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        lazy: false,
        create: ( _ ) => AuthProvider()
      ),
      ChangeNotifierProvider(
        lazy: false,
        create:  (_) => SidemenuProvider()
      )
    ],child: MyApp(),);
  }
}
class MyApp extends StatelessWidget{
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
            debugShowCheckedModeBanner:false,
            title:'admin',
            initialRoute: FluroRouters.logingRoute,
            onGenerateRoute : FluroRouters.router.generator,
            navigatorKey:  locator<CustomNavigationService>().navigatorKey,
            builder: ( _ , child ){
              final authProvider = Provider.of<AuthProvider>( context,listen: true );
              if( authProvider.stateLogin == StateLogin.authenticted){
                  return DasboardLayouts(child: child! );
                }
                if( authProvider.stateLogin == StateLogin.checking){
                  return splashLayout();
                }
                else{
                  return AuthLayout(child: child! );
                }         
            }
          );

  }
}