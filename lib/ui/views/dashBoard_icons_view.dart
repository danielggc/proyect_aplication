import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_aplication/ui/cards/white_card.dart';
import 'package:proyect_aplication/ui/labels/custom_labels.dart';

class dashBoardIconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text( 'icons', style: CustomLabel.h1B ,),
          SizedBox( height:  10 ,),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'nat_outlined',
                child: Icon(Icons.nat_outlined),
                width: 170,
              ),
              WhiteCard(
                title: 'account_box_sharp',
                child: Icon(Icons.account_box_sharp),
                width: 170,
              ),
              WhiteCard(
                title: 'add_home_work_sharp',
                child: Icon(Icons.add_home_work_sharp),
                width: 170,
              ),
              WhiteCard(
                title: 'safety_check_rounded',
                child: Icon(Icons.safety_check_rounded),
                width: 170,
              ),
              WhiteCard(
                title: 'earbuds',
                child: Icon(Icons.earbuds),
                width: 170,
              ),
              WhiteCard(
                title: 'label_off',
                child: Icon(Icons.label_off),
                width: 170,
              )
            ],
          )
        ],
      ),
    );
  }
}