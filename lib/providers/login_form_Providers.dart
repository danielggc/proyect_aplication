import 'package:flutter/cupertino.dart';
import 'package:proyect_aplication/providers/auth_provider.dart';

class LoginFormProviders extends ChangeNotifier{
  
  GlobalKey<FormState> formKey  = new GlobalKey<FormState>();
  final AuthProvider authProvider;
  LoginFormProviders( this.authProvider );
  String _email = '';
  String _passwors = '' ;
  updateLogin( String? email  , String? password ){
    this._email = email ?? '' ;
    this._passwors = password ?? '';
     
    
    
  }
  login(){
    authProvider.login( this._email, this._passwors );  
  }
  bool validateForm(){
    if( formKey.currentState!.validate( )){
      print(" fomr valid .... login ");
      print(' $_email === $_passwors'); 
      return true;
    }else{
      print('fomr no valid');
      return false;
    }
  }
}