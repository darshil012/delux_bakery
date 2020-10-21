import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(49);

  @override
  Widget build(BuildContext context){
    return Column(

      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25.0),
          decoration: BoxDecoration(
            color: Color(0xFF3F48CC)
          ),
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
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