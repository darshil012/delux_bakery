import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:delux_bakery/components/notif_home.dart';
import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TOP
      appBar: UserAppBar(),
      drawer: UserDrawer(),

      //BODY
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
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*3/4,
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(

                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/rupee.png',),
                              alignment: Alignment.centerRight,
                              scale: 1.5,

                            ),
                            boxShadow: [BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0
                            )],
                            borderRadius: BorderRadius.circular(13)
                          ),
                          height: MediaQuery.of(context).size.height*0.12,
                          width: MediaQuery.of(context).size.width*0.90,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 8,),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 15,),
                                  Text(
                                    'Worth balance in Delux Bakery',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 15,),
                                  Text(
                                    '-₹2,000',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20,),
                        NotifHome()
                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*.90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2
                                )]
                            ),
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width*.90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.black)
                                      )
                                  ),
                                  child: Text(
                                    "Today's Order",
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.black)
                                      )
                                  ),
                                  child: Text("Veiw all Order",),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.black)
                                      )
                                  ),
                                  child: Text("Item Report",),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.black)
                                      )
                                  ),
                                  child: Text("Total Transaction",),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.98,
                            child: FlatButton(
                              onPressed: (){},
                              minWidth: MediaQuery.of(context).size.width*0.90,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                    offset: Offset(0.3,0.2)
                                  )]
                                ),
                                child: Center(
                                  child: Text(
                                    "Send GPS Location",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),

      //BOTTOM
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
            Expanded(child: IconButton(icon: Icon(Icons.home,color: Colors.indigo,), onPressed: (){},)),
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