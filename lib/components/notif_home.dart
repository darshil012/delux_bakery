import 'package:flutter/material.dart';

class NotifHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.transparent,
          elevation: 0,
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.width*0.20,
                decoration: BoxDecoration(
                    color: Color(0xFFD50F0F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                    )]
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Test me Best Delux Bakery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                'Lorem ipsum dolar sit amet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.only(left: 15.0),
            shadowColor: Colors.black54,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/bake_image2.png'),
                      fit: BoxFit.fill,
                    )
                  ),

                )
              ],
            )
        )
      ],
    );
  }

}