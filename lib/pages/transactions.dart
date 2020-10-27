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

class _TransactionsScreen extends State<TransactionsScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: UserAppBar(),
      drawer: UserDrawer(),
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
                              '-₹22525',
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
    );
  }
}