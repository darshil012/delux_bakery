import 'package:flutter/material.dart';

class NotifHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.width*0.20,
                decoration: BoxDecoration(
                    color: Colors.red,
                    boxShadow: [BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                    )]
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Test me Best Delux Bakery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
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
            margin: EdgeInsets.only(left: 20.0),
            shadowColor: Colors.black54,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image(
                    image: AssetImage('assets/bake_image2.png'),
                    fit: BoxFit.fill,
                  ),
                )
              ],
            )
        )
      ],
    );
  }

}