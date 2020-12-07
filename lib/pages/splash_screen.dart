import 'dart:async';
import 'package:flutter/material.dart';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'package:delux_bakery/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home())));
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
    // Timer(Duration(seconds: 100), () => print('ok'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: UniversalVariables.backgroundColor,
              image: DecorationImage(
                image: AssetImage('assets/toran.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                repeat: ImageRepeat.repeatX
              )
            ),
          ),
          Column(

            children: <Widget>[

              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height/4,),
                      Image(image: AssetImage('assets/Logo1.png',),width: 250, height: 160,),
                      Text(
                        'The name is Enough',
                        style: TextStyle(
                          fontFamily: 'swashed',
                          fontSize: 20.0,
                          color: Colors.indigo[900],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Stack(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.zero,
                      color: Colors.transparent,
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width-93,
                            height: MediaQuery.of(context).size.height/100,
                            decoration: BoxDecoration(
                                color: Color(0xFFDD8D40)
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/bake_splash.png'),
                          ),

                        ],
                      )
                    ),

                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}