import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delux_bakery/pages/login_page.dart';
import 'package:delux_bakery/pages/otp_verif_test.dart';

bool _obscureText = true;
String _currentPhone;

class RegistrationScreen extends StatefulWidget{
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final myController = TextEditingController();
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height+50,
          decoration: BoxDecoration(color: Color(0xFFF4F5FC)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.of(context).size.height+50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40,),
                          Image(image: AssetImage('assets/Logo1.png'),width: 200,),
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
                                color: Color(0xFFE4001B),
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            'Enter your information below to',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'poppin',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0A287E)
                            ),
                          ),
                          Text(
                            'create a new account',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'poppin',
                                color: Color(0xFF0A287E)
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              cursorColor: Color(0xFF0A287E),
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8.0, left: 20),
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
                                    borderRadius: new BorderRadius.circular(18.0),
                                    borderSide: BorderSide.none,
                                  )
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
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
                                cursorColor: Color(0xFF0A287E),
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 8.0, left: 20),
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
                                      borderRadius: new BorderRadius.circular(18.0),
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
                                    offset: Offset(0.5,1),
                                    spreadRadius: 0.2,
                                  )]
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.0),
                          ),
                          Container(
                              child: TextFormField(
                                cursorColor: Color(0xFF0A287E),
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 8.0, left: 20),
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
                                      borderRadius: new BorderRadius.circular(18.0),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [BoxShadow(
                                    color: Color(0xFF939393),
                                    blurRadius: 0.5,
                                    offset: Offset(0.5,1),
                                    spreadRadius: 0.2,
                                  )]
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.0),
                          ),
                          Container(
                            child: TextFormField(
                              cursorColor: Color(0xFF0A287E),
                              focusNode: myFocusNode,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(top: 8.0, left: 20),
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
                                  borderRadius: new BorderRadius.circular(18.0),
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
                                borderRadius: BorderRadius.circular(18),
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
                              cursorColor: Color(0xFF0A287E),
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(top: 8.0, left: 20),
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
                                  borderRadius: new BorderRadius.circular(18.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              obscureText: _obscureText,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [BoxShadow(
                                  color: Color(0xFF939393),
                                  blurRadius: 0.5,
                                  offset: Offset(0.5,1),
                                  spreadRadius: 0.2,
                                )]
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0),
                          ),
                          Container(
                            height: 45.0,
                            child: FlatButton(
                              onPressed: () {
                                print(_currentPhone);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(_currentPhone)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF0A287E),
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
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              'Sign in',
                                              style: TextStyle(
                                                  color: Color(0xFF0A287E),
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
}
// Stack(
// children: <Widget>[
// Container(
// padding: const EdgeInsets.only(left: 20.0,right: 20.0),
// decoration: BoxDecoration(color: Color(0xFFF4F5FC)),
// child: Column(
// children: <Widget>[
// Expanded(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Image(image: AssetImage('assets/Logo1.png'), width: 250,),
// ],
// ),
// ),
// Expanded(
// flex: 3,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: <Widget>[
// TextFormField(
// decoration: new InputDecoration(
// contentPadding: EdgeInsets.only(top: 8.0),
// labelText: 'Shop name',
// prefixIcon: Icon(Icons.person),
// fillColor: Colors.white,
// border: new OutlineInputBorder(
// borderRadius: new BorderRadius.circular(25.0),
// borderSide: new BorderSide(),
// )
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 12.0),
// ),
// TextFormField(
// keyboardType: TextInputType.number,
// decoration: new InputDecoration(
// contentPadding: EdgeInsets.only(top: 8.0),
// labelText: 'Phone number',
// prefixIcon: Icon(Icons.person),
// fillColor: Colors.white,
// border: new OutlineInputBorder(
// borderRadius: new BorderRadius.circular(25.0),
// borderSide: new BorderSide(),
// )
// ),
// onChanged: (value) {
// print(value);
// setState(() {
// _currentPhone = value;
// });
// },
// ),
// Padding(
// padding: EdgeInsets.only(top: 12.0),
// ),
// TextFormField(
// keyboardType: TextInputType.emailAddress,
// decoration: new InputDecoration(
// contentPadding: EdgeInsets.only(top: 8.0),
// labelText: 'E-mail',
// prefixIcon: Icon(Icons.person),
// fillColor: Colors.white,
// border: new OutlineInputBorder(
// borderRadius: new BorderRadius.circular(25.0),
// borderSide: new BorderSide(),
// )
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 12.0),
// ),
// TextFormField(
// decoration: new InputDecoration(
// contentPadding: EdgeInsets.only(top: 8.0),
// labelText: 'Password',
// prefixIcon: Icon(Icons.lock),
// fillColor: Colors.white,
// border: new OutlineInputBorder(
// borderRadius: new BorderRadius.circular(25.0),
// borderSide: new BorderSide(),
// ),
// suffixIcon: IconButton(
// icon: Icon(
// _obscureText ? Icons.visibility : Icons.visibility_off
// ),
// onPressed: (){
// setState(() {
// _obscureText = !_obscureText;
// });
// },
// ),
// ),
// obscureText: _obscureText,
// ),
// Padding(
// padding: EdgeInsets.only(top: 12.0),
// ),
// TextFormField(
// decoration: new InputDecoration(
// contentPadding: EdgeInsets.only(top: 8.0),
// labelText: 'Re-Type Password',
// prefixIcon: Icon(Icons.lock),
// fillColor: Colors.white,
// border: new OutlineInputBorder(
// borderRadius: new BorderRadius.circular(25.0),
// borderSide: new BorderSide(),
// ),
// ),
// obscureText: false,
// ),
// Container(
// height: 45,
// child: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// Text(
// 'Already Registered?  ',
// style: TextStyle(
// color: Colors.grey.shade700,
// fontSize: 10.0
// ),
// ),
// GestureDetector(
// onTap: (){
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
// },
// child: Container(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// Center(
// child: Text(
// 'Sign in',
// style: TextStyle(
// color: Colors.indigo,
// fontSize: 14,
// fontWeight: FontWeight.w600
// ),
// ),
// )
// ],
// ),
// ),
// )
// ],
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 12.0),
// ),
// Container(
// height: 45.0,
// child: FlatButton(
// onPressed: () {
// print(_currentPhone);
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(_currentPhone)));
// },
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.indigo,
// style: BorderStyle.solid,
// width: 1.0,
// ),
// color: Colors.indigo,
// borderRadius: BorderRadius.circular(30.0),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Center(
// child: Text(
// "Sign Up",
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Montserrat',
// fontSize: 16,
// fontWeight: FontWeight.w600,
// letterSpacing: 1,
// ),
// ),
// )
// ],
// ),
// ),
// ),
// )
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),