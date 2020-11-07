import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:delux_bakery/components/zoom_scaffold.dart';
import 'package:delux_bakery/components/notif_home.dart';
import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  double borderRadius = 0.0;
  MenuController menuController;
  AppBar appbar = AppBar();

  TabController tabController;
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController controller;


  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    menuController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return WillPopScope(
      onWillPop: () async {
        if(!isCollapsed){
          setState(() {
            controller.reverse();
            borderRadius = 0.0;
            isCollapsed = !isCollapsed;
          });
          return false;
        }
        else
          return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            menu(context),
            AnimatedPositioned(
                left: isCollapsed ? 0 : 0.6 * screenWidth,
                right: isCollapsed ? 0 : -0.2 * screenWidth,
                top: isCollapsed ? 0 : screenHeight * 0.1,
                bottom: isCollapsed ? 0 : screenHeight * 0.1,
                duration: duration,
                curve: Curves.fastOutSlowIn,
                child: dashboard(context)
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 0.8,
            child: UserDrawer(),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context){
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        type: MaterialType.card,
        animationDuration: duration,

        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Scaffold(
            //TOP
            appBar: AppBar(
              backgroundColor: Color(0xFF0A287E),
              title: Text('SandwichKing'),
              leading: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: controller,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isCollapsed) {
                        controller.forward();

                        borderRadius = 16.0;
                      } else {
                        controller.reverse();

                        borderRadius = 0.0;
                      }

                      isCollapsed = !isCollapsed;
                    });
                  }),
            ),

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
                                                  color: Color(0xFF1C3787),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 28,
                                                  fontFamily: 'poppin'
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
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width-50,
                                    height: 215,
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
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width:MediaQuery.of(context).size.width-50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.black26))
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, top: 12),
                                                  child: Image.asset('assets/choices.png'),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 60, top: 16),
                                                  child: Text(
                                                    "Today's Orders",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width:MediaQuery.of(context).size.width-50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.black26))
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, top: 12),
                                                  child: Image.asset('assets/check-list.png'),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 60, top: 16),
                                                  child: Text(
                                                    'View all Orders',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width:MediaQuery.of(context).size.width-50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.black26))
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, top: 12),
                                                  child: Image.asset('assets/analysis-rep.png'),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 60, top: 16),
                                                  child: Text(
                                                    'Item Report',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width:MediaQuery.of(context).size.width-50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.black26))
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 20, top: 12),
                                                  child: Image.asset('assets/transaction.png'),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 60, top: 16),
                                                  child: Text(
                                                    'Total Transactions',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: SizedBox(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width-30,
                                    child: FlatButton(
                                      onPressed: (){_getCurrentLocation();},
                                      minWidth: MediaQuery.of(context).size.width-50,
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
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.edit_location,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "Send GPS Location",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    fontFamily: 'poppin'
                                                ),
                                              )
                                            ],
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
                  Expanded(child: IconButton(icon: Icon(Icons.home,color: Color(0xFF0A287E),), onPressed: (){},)),
                  Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined), onPressed: (){Navigator.pushReplacementNamed(context, '/report');},)),
                  Expanded(child: new Text('')),
                  Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
                  Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() async{
    var forceAndroidLocationManager;

    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      print(_currentPosition.toString());
    }).catchError((e) {
      print(e);
    });
  }

}