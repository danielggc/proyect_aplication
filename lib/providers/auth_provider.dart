import 'package:flutter/cupertino.dart';
import 'package:proyect_aplication/services/local_storage.dart';
enum StateLogin {
  checking,
  authenticted,
  notAuthentication,
}

class AuthProvider  extends ChangeNotifier{

  StateLogin stateLogin = StateLogin.notAuthentication;
    AuthProvider(){
      isAuthenticated();
    }

  String? _token;
  login( String email, String password ){
    this._token = 'd507963a1a839f21df05b5c7e9a2ad22b6f7e905e5ea2cdc787bf668605f2dcc';
    LocalStorage.preferences.setString('token',_token!);
    final String dd = LocalStorage.preferences.getString('token')!;
    print('almansenar JMT : ${dd}');
    stateLogin  = StateLogin.checking;  
    isAuthenticated();
    notifyListeners();
  }

  Future<bool> isAuthenticated() async{
    print("empezando la validacion");
    final token   = LocalStorage.preferences.getString('token');
    bool state    = false;
    if( token == null ){
      print("es nulo");
      stateLogin = StateLogin.notAuthentication;
      state  =  false;
    }else{
      await Future.delayed( Duration(milliseconds: 1500 ));
      stateLogin = StateLogin.authenticted;
      print("autenticado");
      state =  true;
    }
    notifyListeners();
    return state;
  }
}