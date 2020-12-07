import 'dart:convert';
import 'dart:io';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'package:delux_bakery/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alice/alice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:delux_bakery/api_conn/api_connection.dart';

import 'package:delux_bakery/pages/login_page.dart';
import 'package:delux_bakery/pages/otp_verif_test.dart';
import 'package:delux_bakery/models/UserResponse.dart';
import 'package:delux_bakery/models/user.dart';

bool _obscureText = true;
String _currentPhone;

class RegistrationScreen extends StatefulWidget{
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final myController = TextEditingController();
  final shopNameController = TextEditingController();
  final emailController = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height + 50,
            decoration: BoxDecoration(color: UniversalVariables.backgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.95,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height + 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 40,),
                            Image(image: AssetImage('assets/Logo1.png'),
                              width: 200,),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'poppin',
                                  color: UniversalVariables.darkRed,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              'Enter your information below to',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w400,
                                  color: UniversalVariables.blue,
                              ),
                            ),
                            Text(
                              'create a new account',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'poppin',
                                  color: UniversalVariables.blue,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: TextFormField(
                                controller: shopNameController,
                                cursorColor: UniversalVariables.blue,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 8.0, left: 20),
                                    hintText: 'Shop name',
                                    hintStyle: TextStyle(
                                        fontFamily: 'poppin',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFBBBBBB)
                                    ),
                                    //prefixIcon: Icon(Icons.person),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(
                                          18.0),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [BoxShadow(
                                    color: Color(0xFF939393),
                                    blurRadius: 0.5,
                                    offset: Offset(0.5, 1),
                                    spreadRadius: 0.2,
                                  )
                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                            ),
                            Container(
                                child: TextFormField(
                                  controller: myController,
                                  cursorColor: UniversalVariables.blue,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 8.0, left: 20),
                                      hintText: 'Phone number',
                                      hintStyle: TextStyle(
                                          fontFamily: 'poppin',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBBBBBB)
                                      ),
                                      //prefixIcon: Icon(Icons.call_outlined),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                            18.0),
                                        borderSide: BorderSide.none,
                                      )
                                  ),
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      _currentPhone = value;
                                    });
                                  },
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [BoxShadow(
                                      color: Color(0xFF939393),
                                      blurRadius: 0.5,
                                      offset: Offset(0.5, 1),
                                      spreadRadius: 0.2,
                                    )
                                    ]
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                            ),
                            Container(
                                child: TextFormField(
                                  controller: emailController,
                                  cursorColor: UniversalVariables.blue,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 8.0, left: 20),
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                          fontFamily: 'poppin',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBBBBBB)
                                      ),
                                      //prefixIcon: Icon(Icons.email_outlined),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                            18.0),
                                        borderSide: BorderSide.none,
                                      )
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [BoxShadow(
                                      color: Color(0xFF939393),
                                      blurRadius: 0.5,
                                      offset: Offset(0.5, 1),
                                      spreadRadius: 0.2,
                                    )
                                    ]
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                            ),
                            Container(
                              child: TextFormField(
                                controller: password,
                                cursorColor: UniversalVariables.blue,
                                focusNode: myFocusNode,
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 8.0, left: 20),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'poppin',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFBBBBBB)
                                  ),
                                  //prefixIcon: Icon(Icons.lock),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(
                                        18.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText ? Icons.visibility : Icons
                                          .visibility_off,
                                      color: myFocusNode.hasFocus ? UniversalVariables
                                          .blue : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _obscureText,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return 'Empty';
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [BoxShadow(
                                    color: Color(0xFF939393),
                                    blurRadius: 0.5,
                                    offset: Offset(0.5, 1),
                                    spreadRadius: 0.2,
                                  )
                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                            ),
                            Container(
                              child: TextFormField(
                                controller: confirmPassword,
                                cursorColor: UniversalVariables.blue,
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 8.0, left: 20),
                                  hintText: 'Re-Type Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'poppin',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFBBBBBB)
                                  ),
                                  //prefixIcon: Icon(Icons.lock),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(
                                        18.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                obscureText: _obscureText,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Empty';
                                  }
                                  else if (val != password.text) {
                                    return 'Not Match';
                                  }
                                  else {
                                    return null;
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [BoxShadow(
                                    color: Color(0xFF939393),
                                    blurRadius: 0.5,
                                    offset: Offset(0.5, 1),
                                    spreadRadius: 0.2,
                                  )
                                  ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18.0),
                            ),
                            Container(
                              height: 45.0,
                              child: FlatButton(
                                onPressed: emailController.text == "" ||
                                    password.text == "" ||
                                    myController.text == "" ||
                                    shopNameController.text == "" ||
                                    confirmPassword.text == "" ? null : () => onRegBtnPressed(shopNameController.text, emailController.text, myController.text, password.text, confirmPassword.text),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: UniversalVariables.blue,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: UniversalVariables.blue,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'poppin',
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
                              height: 45,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Already Registered?  ',
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 10.0
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                'Sign in',
                                                style: TextStyle(
                                                    color: UniversalVariables.blue,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
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
    );
  }
  void onRegBtnPressed(name, email, phoneNumber, password, confirmPassword){
    getToken(UserRegistration(name: name, userName: phoneNumber, email: email, userPhone: phoneNumber, userPassword: password, userConfirmPassword: confirmPassword));
    print('SUCCESS');
    Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(phoneNumber,screenChoice:'home')));
  }
}