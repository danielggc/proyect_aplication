import 'package:flutter/cupertino.dart';

class NavbarAvatar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(
      child: Container(
        child: Image.asset('pngegg.png'),
        width: 40,
        height: 40,
      )
    );
  }
}