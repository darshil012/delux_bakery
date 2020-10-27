import 'package:flutter/material.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class NotificationWidget extends StatefulWidget{
  @override
  _NotificationWidget createState() => _NotificationWidget();
}

class _NotificationWidget extends State<NotificationWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: UserAppBar(),
      drawer: UserDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFF4F5FC)
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w800,
                            fontSize: 24
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.92,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.black45,
                        offset: Offset(0.7,2)
                      )]
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 15,),
                        Image(image: AssetImage('assets/rupee_sign.png')),
                        SizedBox(width: 15,),
                        Container(
                          child: Text('Lorem ipsum dolor sit amet'),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.92,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.black45,
                            offset: Offset(0.7,2)
                        )]
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 15,),
                        Icon(Icons.notifications, color: Colors.red,),
                        SizedBox(width: 15,),
                        Container(
                          child: Text('Lorem ipsum dolor sit amet'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){Navigator.pushNamed(context, '/punch_order');},
        child: Image(
          image: AssetImage('assets/ico-hand.png'),
          width: 25,
        ),
        backgroundColor: Color(0xFFE4001B),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined), onPressed: (){Navigator.pushReplacementNamed(context, '/report');},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications, color: Color(0xFF0A287E),), onPressed: (){},)),
            Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
