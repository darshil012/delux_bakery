import 'package:flutter/material.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'components/zoom_scaffold.dart';

class NotificationWidget extends StatefulWidget{
  @override
  _NotificationWidget createState() => _NotificationWidget();
}

class _NotificationWidget extends State<NotificationWidget> with TickerProviderStateMixin {
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
                    backgroundColor: UniversalVariables.blue,
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
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                color: UniversalVariables.backgroundColor,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.92,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [BoxShadow(
                                        blurRadius: 2.0,
                                        color: Colors.black45,
                                        offset: Offset(0.7, 2)
                                    )
                                    ]
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.92,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [BoxShadow(
                                        blurRadius: 2.0,
                                        color: Colors.black45,
                                        offset: Offset(0.7, 2)
                                    )
                                    ]
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/punch_order');
                    },
                    child: Image(
                      image: AssetImage('assets/ico-hand.png'),
                      width: 25,
                    ),
                    backgroundColor: UniversalVariables.darkRed,
                    elevation: 4.0,
                  ),
                  bottomNavigationBar: BottomAppBar(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },)),
                        Expanded(child: IconButton(
                          icon: Icon(Icons.text_snippet_outlined), onPressed: () {
                          Navigator.pushReplacementNamed(context, '/report');
                        },)),
                        Expanded(child: new Text('')),
                        Expanded(child: IconButton(
                          icon: Icon(Icons.notifications, color: UniversalVariables.blue,),
                          onPressed: () {},)),
                        Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: () {
                          Navigator.pushNamed(context, '/user');
                        },)),
                      ],
                    ),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                )
            )
        )
    );
  }
}