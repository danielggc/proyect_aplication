import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyect_aplication/providers/register_form_providers.dart';
import 'package:proyect_aplication/router/router.dart';
import 'package:proyect_aplication/ui/buttons/custom_outlined.dart';
import 'package:proyect_aplication/ui/buttons/link_text.dart';
import 'package:proyect_aplication/ui/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(create: ( _ ) => RegisterFormProviders(),
      child : Builder(builder:(context){
      final registerFormProviders  = Provider.of<RegisterFormProviders>( context, listen: false );
      return Container(
              margin: EdgeInsets.only( top:  100),
              padding: EdgeInsets.symmetric(horizontal: 100 ),
              color : Colors.black,
              child: Center(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProviders.formKey,
                  child:ConstrainedBox(
                    constraints:  BoxConstraints(maxHeight: 370 ),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: ((value) {
                            if( value == null || value.isEmpty) return 'ingrese su usuario';
                            if( value.length < 6 ) return 'usario no valida';
                            return null;
                                 
                          }),
                          style: TextStyle( color: Colors.white ),
                          decoration: CustomInput.buildInputDecorationLogin(
                          hint: " ingresar su nombre" ,
                          label: "nombre",
                          icon: Icons.person_pin_sharp,
                          ) ,
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                        validator: ((value) {
                            if( !EmailValidator.validate(value ?? '') ) return 'email no valido';
                          }),
                          style: TextStyle( color: Colors.white ),
                          decoration: CustomInput.buildInputDecorationLogin(
                          hint: " ingresar su correo" ,
                          label: "email",
                          icon: Icons.email,
                          ) ,
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                                  validator: ((value) {
                                    if( value == null || value.isEmpty) return 'ingrese su contrasseña';
                                    if( value.length < 6 ) return 'contraseña no valida';
                                    return null;
                                  }),
                          style: TextStyle( color: Colors.white ),
                          decoration: CustomInput.buildInputDecorationLogin(
                          hint:  "********" ,
                          label: "Contraseña",
                          icon: Icons.lock_outline_rounded,
                          ) ,
                        ),
                        SizedBox(height: 10,),
                        CustomOutlined(onPressed: ()=> {
                          registerFormProviders.validateForm()
                        },  text: "crear", isfilled:  false,),
                        SizedBox(height: 20,),
                        LinkText( nameLink:  "ingresar" , onPressed: (){
                          Navigator.pushNamed(context, FluroRouters.logingRoute);
                        },)
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



}