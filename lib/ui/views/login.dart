import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_aplication/providers/auth_provider.dart';
import 'package:proyect_aplication/providers/login_form_Providers.dart';
import 'package:proyect_aplication/router/router.dart';
import 'package:proyect_aplication/services/custom_navigation_service.dart';
import 'package:proyect_aplication/services/locator.dart';
import 'package:proyect_aplication/ui/buttons/custom_outlined.dart';
import 'package:proyect_aplication/ui/buttons/link_new.dart';
import 'package:proyect_aplication/ui/buttons/link_text.dart';
import 'package:proyect_aplication/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final authProvider =  Provider.of<AuthProvider>( context , listen:  false );
    // TODO: implement build
    final  email = new  TextEditingController();
    final  password = new TextEditingController();
        
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProviders( authProvider ),
      child: Builder(builder: (context) {
      final loginFormProviders  = Provider.of<LoginFormProviders>(context, listen: false);
      
      return Container(
              margin: EdgeInsets.only( top:  100),
              padding: EdgeInsets.symmetric(horizontal: 100 ),
              color : Colors.black,
              child: Center(
                child: Form(
                  key: loginFormProviders.formKey,
                  child:ConstrainedBox(
                    constraints:  BoxConstraints(maxHeight: 370 ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: ((value) {
                            if( !EmailValidator.validate(value ?? '') ) return 'email no valido';
                          }),
                          style: TextStyle( color: Colors.white ),
                          decoration: CustomInput.buildInputDecorationLogin(
                          hint: " ingresa su correo" ,
                          label: "email",
                          icon: Icons.email,
                          ) ,
                        ),
                        SizedBox( height: 20, ),
                        TextFormField(
                          validator: ((value) {
                            if( value == null || value.isEmpty) return 'ingrese su contrasseña';
                            if( value.length < 6 ) return 'contraseña no valida';
                            return null;
                          }),
                          controller: password,
                          style: TextStyle( color: Colors.white ),
                          decoration: CustomInput.buildInputDecorationLogin(
                          hint:  "********" ,
                          label: "Contraseña",
                          icon: Icons.lock_outline_rounded,
                          ) ,
                        ),
                        SizedBox(height: 10,),
                        CustomOutlined(
                          onPressed: () => {
                            loginFormProviders.updateLogin( email.text  , password.text ),
                            if( loginFormProviders.validateForm() ) 
                              loginFormProviders.login()
                        },
                        text: "Ingresar", isfilled:  true,),  
                        SizedBox(height: 20,),
                        LinkText( nameLink:  "crear nueba cuenta" , onPressed: () {
                          locator<CustomNavigationService>().navigationTo( FluroRouters.registerRoute );
                        }),
                        LinkNew(),
                      ],
                    )
                  ),
                )
              )
            );
          }
       )
     );
  }


  InputDecoration buildInputDecoration( { required String hint ,required String label , required IconData icon  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      
      enabledBorder:  OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.white.withOpacity(0.3))
      ),
      
      hintText: hint,
      labelText: label,
      prefixIcon:Icon( icon, color:Colors.grey ),
      labelStyle: TextStyle( color:  Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey)

    );

  }
}