import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class PunchOrder extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PunchOrder();
  }
}

class _PunchOrder extends State<PunchOrder> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  int dabeli = 0;
  int vadapav = 0;
  int bread = 0;
  int pizza_bread = 0;
  int puff_veg = 0;
  int chinese_puff = 0;
  int jamboo_pav = 0;

  void _runAnimation() async {
    for (int i = 0; i < 1; i++) {
      await _animationController.forward();
      await _animationController.reverse();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _runAnimation();
    super.initState();
  }

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
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/menucurve.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter
                    ),
                    color: Color(0xFFF4F5FC)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*3/4,
                          child: Stack(
                            children: <Widget>[
                              Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 180),
                                  child: RotationTransition(
                                    turns: Tween(begin: 0.0, end: -.1)
                                        .chain(CurveTween(curve: Curves.elasticIn))
                                        .animate(_animationController),
                                    child: Icon(Icons.notifications, color: Colors.indigo.shade300.withAlpha(200), size: 65, ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'You can order up to',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '10:00 pm of the day',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Punch Order',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.96,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 5),
                                child: Text(
                                  'Item Name',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 233, top: 5),
                                child: Text(
                                    'Quantity',
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black26)
                            )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Dabeli Pav',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: dabeli!=0 ? () => setState(() => dabeli--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$dabeli',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => dabeli++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Vada Pav',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: vadapav!=0 ? () => setState(() => vadapav--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$vadapav',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => vadapav++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Bread Regular',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: bread!=0 ? () => setState(() => bread--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$bread',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => bread++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Pizza Bread',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: pizza_bread!=0 ? () => setState(() => pizza_bread--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$pizza_bread',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => pizza_bread++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Puff Veg.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: puff_veg!=0 ? () => setState(() => puff_veg--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$puff_veg',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => puff_veg++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Chinese Puff',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: chinese_puff!=0 ? () => setState(() => chinese_puff--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$chinese_puff',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => chinese_puff++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)
                              )
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 40, top: 10),
                                child:Text(
                                  'Jamboo Pav',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 185),
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                        onPressed: jamboo_pav!=0 ? () => setState(() => jamboo_pav--) : null,
                                        minWidth: 26,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.remove, color: Colors.white,)
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6),
                                          boxShadow: [BoxShadow(
                                              blurRadius: 1,
                                              color: Colors.black45,
                                              offset: Offset(1,1)
                                          )]
                                      ),
                                      child: Text(
                                        '$jamboo_pav',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () => setState(() => jamboo_pav++),
                                        minWidth: 26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Icon(Icons.add, color: Colors.white)
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
        child: new Icon(Icons.bakery_dining),
        backgroundColor: Colors.redAccent,
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined), onPressed: (){Navigator.pushReplacementNamed(context, '/report');},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}