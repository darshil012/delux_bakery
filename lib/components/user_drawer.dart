import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.5),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/users-vector.jpg')
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 85),
                    child: Container(
                      child: Text(
                        '4IT Sol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: Container(
                      child: Text(
                        'Himatnagar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF0A287E)
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: (){Navigator.pushReplacementNamed(context, '/home');},
          ),
          ListTile(
            title: Text('Transaction'),
            onTap: (){Navigator.pushReplacementNamed(context, '/transactions_screen');},
          ),
          ListTile(
            title: Text('Notification'),
            onTap: (){Navigator.pushReplacementNamed(context, '/notifs');},
          ),
          ListTile(
            title: Text('Services Request'),
            onTap: (){Navigator.pushReplacementNamed(context, '/request_services');},
          ),
          ListTile(
            title: Text('Terms & Conditions'),
            onTap: (){},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: (){},
          ),
          ListTile(
            title: Text('Product Services'),
            onTap: (){},
          ),
          ListTile(
            title: Text('Log Out'),
            onTap: (){Navigator.pushReplacementNamed(context, '/');},
          ),
        ],
      ),
    );
  }

}