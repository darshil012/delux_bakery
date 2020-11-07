import 'package:delux_bakery/components/zoom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class TransactionsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TransactionsScreen();
  }
}

class _TransactionsScreen extends State<TransactionsScreen> with TickerProviderStateMixin{
  double borderRadius = 0.0;
  MenuController menuController;
  AppBar appbar = AppBar();

  TabController tabController;
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )
      ..addListener(() => setState(() {}));
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
    Size size = MediaQuery
        .of(context)
        .size;
    screenHeight = size.height;
    screenWidth = size.width;
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (!isCollapsed) {
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

  Widget dashboard(context) {
    return SafeArea(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            type: MaterialType.card,
            animationDuration: duration,

            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              child: Scaffold(
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
                body: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFEB6E7F),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Container(
                                child: Container(
                                  width: MediaQuery.of(context).size.width*8/9-15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Available Balance',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        ),
                                      ),
                                      Text(
                                        '-₹2000',
                                        style: TextStyle(
                                            color: Color(0xFF0A287E),
                                            fontSize: 26,
                                            fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/9,
                                child: Image.asset('assets/rupee-blue.png'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [BoxShadow(
                                  color: Color(0xFF707070),
                                  blurRadius: 0.4,
                                  offset: Offset(0.2,0.5)
                              )],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 5,),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.20,
                                  height: MediaQuery.of(context).size.width*0.20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '26',
                                        style: TextStyle(
                                            color: Color(0xFF3B3B3B),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900
                                        ),
                                      ),
                                      Text(
                                        'October',
                                        style: TextStyle(
                                          color: Color(0xFF3B3B3B),
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  color: Color(0xFF1C3787),
                                  height: MediaQuery.of(context).size.height*0.09,
                                  width: 4,
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Lorem ipsum',
                                        style: TextStyle(
                                          color: Color(0xFF1C3787),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.57,
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                                          style: TextStyle(
                                            color: Color(0xFF272727),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '₹202',
                                    style: TextStyle(
                                      color: Color(0xFFD50F0F),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}