import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45, width: 2.0))
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.5),
                    image: DecorationImage(
                        image: AssetImage('assets/users-vector.jpg')
                    )
                ),
              ),
              Container(
                child: Text(
                  'SandwichKing',
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Himatnagar',
                  style: TextStyle(
                      fontSize: 14
                  ),
                ),
              ),
              SizedBox(height: 25,)
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){Navigator.pushReplacementNamed(context, '/home');},
              child: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, '/transactions_screen');},
              child: Text(
                'Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, '/notifs');},
              child: Text(
                'Notification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, '/request_services');},
              child: Text(
                'Services Request',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Terms & Conditions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 10),
            Text(
              'Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 10),
            Text(
              'Product Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){Navigator.pushReplacementNamed(context, '/');},
              child: Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            )
          ],
        )
      ],
    );
  }

}