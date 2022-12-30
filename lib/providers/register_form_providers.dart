import 'package:flutter/cupertino.dart';

class RegisterFormProviders extends ChangeNotifier{

  GlobalKey<FormState> formKey  = new GlobalKey<FormState>();
  String email = '';
  String passwors = '' ;
  String name  = 'name';
  validateForm(){
    formKey.currentState!.validate();
  }
}