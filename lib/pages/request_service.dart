import 'package:delux_bakery/components/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class RequestServices extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _RequestServices();
  }
}

class _RequestServices extends State<RequestServices> with TickerProviderStateMixin{
  String _value = DateTime.now().toString();

  String dropdownValue;

  final dateFormat = DateFormat("dd/MM/yyyy");

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

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
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFFF4F5FC)
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  'Services Request',
                                  style: TextStyle(
                                      color: UniversalVariables.primaryColor,
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
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DropdownButtonFormField<String>(
                                  icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                                  iconSize: 24,
                                  elevation: 16,
                                  decoration: InputDecoration(
                                    hintText: 'Select Action',
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(top: 8.0, left: 10),
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.indigo),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>['One', 'Two', 'Three', 'Four']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DropdownButtonFormField<String>(
                                  icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                                  iconSize: 24,
                                  elevation: 16,
                                  decoration: InputDecoration(
                                    hintText: 'Select Product',
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(top: 8.0, left: 10, bottom: 8.0),
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.indigo),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>['One', 'Two', 'Three', 'Four']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          maxLines: 10,
                                          keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                            hintText: 'Text Here...',
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(18),
                                                borderSide: BorderSide()
                                            ),
                                            contentPadding: EdgeInsets.only(top: 8.0, left: 10),

                                          ),
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: UniversalVariables.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2,
                                offset: Offset(1,1),
                              )],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Send Request',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900
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
                floatingActionButton: new FloatingActionButton(
                  onPressed: (){Navigator.pushNamed(context, '/punch_order');},
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
                      Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: (){Navigator.pushNamed(context, '/home');},)),
                      Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined, color: UniversalVariables.blue,), onPressed: (){},)),
                      Expanded(child: new Text('')),
                      Expanded(child: IconButton(icon: Icon(Icons.notifications,), onPressed: (){Navigator.pushReplacementNamed(context, '/notifs');},)),
                      Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
                    ],
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              ),
            )
        )
    );
  }
}