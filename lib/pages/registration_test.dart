import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delux_bakery/pages/login_page.dart';
import 'package:delux_bakery/pages/otp_verif_test.dart';

bool _obscureText = true;

class RegistrationScreen extends StatefulWidget{
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  get child => null;
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),

                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage('assets/Logo1.png'), width: 250,),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: ListView(
                          children: <Widget>[
                            TextFormField(
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8.0),
                                  labelText: 'Shop name',
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
                              controller: myController,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8.0),
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8.0),
                                  labelText: 'E-mail',
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
                                contentPadding: EdgeInsets.only(top: 8.0),
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
                            TextFormField(
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(top: 8.0),
                                labelText: 'Re-Type Password',
                                prefixIcon: Icon(Icons.lock),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              obscureText: _obscureText,
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
                                    FlatButton(
                                      onPressed: (){
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
                                                    color: Colors.indigo,
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
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                            ),
                            Container(
                              height: 45.0,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(myController.text)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.indigo,
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
                                          "Sign Up",
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
                            )
                          ],
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ],
        )
    );
  }
}