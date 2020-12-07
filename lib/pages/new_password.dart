import 'package:flutter/material.dart';
import 'package:delux_bakery/utils/universal_variables.dart';
import 'package:delux_bakery/home_widget.dart';

bool _obscureText = true;
bool _confirmObscureText = true;

class NewPasswordScreen extends StatefulWidget{
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final myFocusNode = new FocusNode();
  final confirmFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(color: UniversalVariables.backgroundColor),
            child: Column(children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height/25,),
                    Image(image: AssetImage('assets/Logo1.png'),width:MediaQuery.of(context).size.width/2,),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'New Password',
                    style: TextStyle(
                      color: Color(0xFFD50F0F),
                      fontSize:25,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    'Enter new Password',
                    style: TextStyle(
                      color: UniversalVariables.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                  ),
                  Container(
                    child: TextFormField(
                      controller: passwordController,
                      focusNode: myFocusNode,
                      cursorColor: UniversalVariables.blue,
                      decoration: new InputDecoration(
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                          fontFamily: 'poppin',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFBBBBBB),
                        ),
                        contentPadding: EdgeInsets.only(top: 8.0, left: 20.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(17.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility: Icons.visibility_off,
                            color: myFocusNode.hasFocus ? UniversalVariables.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
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
                  Container(
                    child: TextFormField(
                      controller: confirmPasswordController,
                      focusNode: confirmFocusNode,
                      cursorColor: UniversalVariables.blue,
                      decoration: new InputDecoration(
                        hintText: 'Confirm Password',
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmObscureText ? Icons.visibility : Icons.visibility_off,
                            color: confirmFocusNode.hasFocus ? UniversalVariables.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmObscureText = !_confirmObscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _confirmObscureText,
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
                    height: 50.0,
                    child: GestureDetector(
                      onTap: () {
                        onResetPasswordBtnPressed();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1.0
                          ),
                          color: UniversalVariables.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])
              ),
            ])
          ),
        ],
      ),
    );
  }
  void onResetPasswordBtnPressed() {

  }
}