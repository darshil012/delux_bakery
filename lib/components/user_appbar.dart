import 'package:flutter/material.dart';
import 'package:delux_bakery/components/zoom_scaffold.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget{
  bool isCollapsed;
  final AnimationController controller;
  double borderRadius;
  final Function onPressedMenu;
  UserAppBar( this.isCollapsed, this.controller, this.borderRadius , this.onPressedMenu);


  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context){
    return Column(

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF0A287E)
          ),
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () => onPressedMenu(isCollapsed, controller, borderRadius),
                child: Image(image: AssetImage('assets/hamburger.png'),),
                minWidth: 20,
              ),
              Text(
                'SandwichKing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'poppin',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}