import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/confirm_order.dart';
import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class PunchOrder extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PunchOrder();
  }
}

class FoodItems{
  String foodName;
  int quantity;
  FoodItems(this.foodName, this.quantity);
}

List<FoodItems> foodData = [
  FoodItems("Pizza", 0),
  FoodItems('Burger', 0),
  FoodItems('Vada pav', 0),
  FoodItems('French fries', 0),
  FoodItems('Puff', 0)
];

class _PunchOrder extends State<PunchOrder> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

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
      body: Column(
        children: <Widget>[
          SizedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
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
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width-180),
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
                    height: 80,
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
                        height: 30,
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
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width-130, top: 5),
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
                        height: MediaQuery.of(context).size.height*0.40,
                        child: ListView.builder(
                          itemCount: foodData.length,
                          itemBuilder: (context,pos){
                            return SingleChildScrollView(
                              child: Container(
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
                                        '${foodData[pos].foodName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width-175),
                                      child: Row(
                                        children: <Widget>[
                                          FlatButton(
                                              onPressed: foodData[pos].quantity!=0 ? () => setState(() => foodData[pos].quantity--) : null,
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
                                            height: 20,
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
                                              '${foodData[pos].quantity}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          FlatButton(
                                              onPressed: () => setState(() => foodData[pos].quantity++),
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF0A287E),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: FlatButton(
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Confirm Order',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16,
                                                    color: Color(0xFF0A287E)
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Table(
                                                  children: [

                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'Confirm Order',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
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
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
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
            Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}