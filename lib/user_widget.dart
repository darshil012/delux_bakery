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
                color: Color(0xFFF4F5FC),
                image: DecorationImage(
                  image: AssetImage('assets/userpage_curve.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                )
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 80,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width:125,
                            height: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(62.5),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 0.4,
                                  offset: Offset(0,1)
                              )],
                              image: DecorationImage(
                                image: AssetImage('assets/users-vector.jpg'),
                                fit: BoxFit.fill
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width-50,
                            height: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [BoxShadow(
                                color: Colors.black45,
                                blurRadius: 1,
                                offset: Offset(1,1),
                              )],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width:MediaQuery.of(context).size.width-50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.black26))
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20, top: 12),
                                        child: Icon(Icons.person_outline_outlined),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 60, top: 16),
                                        child: Text('Marmik Patel'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:MediaQuery.of(context).size.width-50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.black26))
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20, top: 12),
                                        child: Icon(Icons.call_outlined),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 60, top: 16),
                                        child: Text('+91 9737571943'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:MediaQuery.of(context).size.width-50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.black26))
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20, top: 12),
                                        child: Icon(Icons.email_outlined),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 60, top: 16),
                                        child: Text('marmikpatel250@gmail.com'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:MediaQuery.of(context).size.width-50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.black26))
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20, top: 12),
                                        child: Icon(Icons.near_me, color: Colors.grey,),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 60, top: 16),
                                        child: Text('19, Shree Hari Bungalows, Opposite Rajtirth township, Hadiyol Road, Himatnagar - 383001'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage('assets/bake_image2.png'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage('assets/bake_image2.png'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage('assets/bake_image2.png'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
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
            Expanded(child: IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined), onPressed: (){Navigator.pushNamed(context, '/report');},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person,color: Color(0xFF0A287E),), onPressed: (){},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}