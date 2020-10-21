import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class Userwidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _UserState();
  }
}

class _UserState extends State<Userwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(),
      drawer: UserDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/userpage_curve.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                )
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width:100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black45,
                        blurRadius: 0.4,
                        offset: Offset(0,1)
                      )]
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){Navigator.pushNamed(context, '/punch_order');},
        child: new Icon(Icons.bakery_dining),
        backgroundColor: Colors.redAccent,
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined), onPressed: (){Navigator.pushNamed(context, '/report');},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person,color: Colors.indigo,), onPressed: (){},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}