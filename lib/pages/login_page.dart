import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delux_bakery/home_widget.dart';

bool _obscureText = true;

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      Image(image: AssetImage('assets/Logo1.png'), width: 250,),
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
                        color: Colors.redAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                    ),
                    Text(
                      'Enter your credentials to Sign in',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'to your account',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Phone number',
                        prefixIcon: Icon(Icons.person),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                          ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off
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
                            color: Colors.blueGrey,
                            fontSize: 12.0
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
                        color: Colors.indigo,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                                  color: Colors.indigo,
                                  fontFamily: 'Montserrat',
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