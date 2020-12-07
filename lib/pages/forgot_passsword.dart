import 'package:flutter/material.dart';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'otp_verif_test.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0, right:20.0),
            decoration: BoxDecoration(color: UniversalVariables.backgroundColor),
            child: Column(children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height/25,),
                    Image(image: AssetImage('assets/Logo1.png'),width: MediaQuery.of(context).size.width/2,),
                  ],
                ),
              ),
              Expanded(
                flex:3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: UniversalVariables.darkRed,
                        fontSize: 25,
                        fontFamily: 'poppin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    Text(
                      'Enter your phone number',
                      style: TextStyle(
                        color: UniversalVariables.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'to change the password.',
                      style: TextStyle(
                        color: UniversalVariables.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    Container(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        cursorColor: UniversalVariables.blue,
                        decoration: new InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontFamily: 'poppin',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFBBBBBB),
                          ),
                          contentPadding: EdgeInsets.only(top: 8.0, left: 20),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(17.0),
                            borderSide: BorderSide.none,
                          ),
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
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Container(
                      height: 50,
                      child: GestureDetector(
                        onTap: () {onSendOTPPressed(phoneController.text);},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
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
                                  'Send OTP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1,
                                  ),
                                ),
                              )
                            ]
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
  void onSendOTPPressed(phone) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PinCodeVerificationScreen(phone, screenChoice:'newpass')));
  }
}