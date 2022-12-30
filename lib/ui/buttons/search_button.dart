import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_aplication/ui/inputs/custom_inputs.dart';

class SearchButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints( maxWidth: 250 ),
      child: Container(
        decoration: boxDecoration(),
        height: 40,
        child: TextField(
          decoration:  CustomInput.searchInputDecoration(
            hint: 'buscar',
            iconData: Icons.search
            ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration (){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.withOpacity(0.1),
    );
  }
}