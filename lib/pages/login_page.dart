import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delux_bakery/home_widget.dart';

bool _obscureText = true;

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0,right: 20.0),
            decoration: BoxDecoration(color: Color(0xFFF4F5FC)),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height/25,),
                      Image(image: AssetImage('assets/Logo1.png'), width: MediaQuery.of(context).size.width/2,),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      'Login Here',
                      style: TextStyle(
                        color: Color(0xFFD50F0F),
                        fontSize: 25,
                        fontFamily: 'poppin',
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    Text(
                      'Enter your Login credentials',
                      style: TextStyle(
                        color: Color(0xFF0A287E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'to Sign in',
                      style: TextStyle(
                        color: Color(0xFF0A287E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Color(0xFF0A287E),
                        decoration: new InputDecoration(
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                              fontFamily: 'poppin',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFBBBBBB)
                            ),
                            contentPadding: EdgeInsets.only(top: 8.0, left: 20),
                            // prefixIcon: Icon(Icons.person),
                            fillColor: Colors.white,
                            filled: true,
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(17.0),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [BoxShadow(
                              color: Color(0xFF939393),
                              blurRadius: 0.5,
                              offset: Offset(0.5,1),
                              spreadRadius: 0.2,
                          )]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                    ),
                    Container(
                      child: TextFormField(
                        focusNode: myFocusNode,
                        cursorColor: Color(0xFF0A287E),
                        decoration: new InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'poppin',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFBBBBBB)
                          ),
                          contentPadding: EdgeInsets.only(top: 8.0, left: 20),
                          // prefixIcon: Icon(Icons.lock),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(17.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: myFocusNode.hasFocus ? Color(0xFF0A287E) : Colors.grey,
                            ),
                            onPressed: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [BoxShadow(
                          color: Color(0xFF939393),
                          blurRadius: 0.5,
                          offset: Offset(0.5,1),
                          spreadRadius: 0.2
                        )]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(''),
                        new FlatButton(
                          color: Color(0xFFF4F5FC),
                          onPressed: (){},
                          child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0xFF0A287E),
                            fontFamily: 'poppin',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                    height: 50.0,
                    child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Color(0xFF0A287E),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                        )
                        ],
                      ),
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                    ),
                    Container(
                      height: 50.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                              child: Text(
                                "Not yet Registered?",
                                style: TextStyle(
                                  color: Color(0xFF0A287E),
                                  fontFamily: 'poppin',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ],
                  ),
                ),
                    ],
              ),
              ),
        ],
      ),
    );
  }
}