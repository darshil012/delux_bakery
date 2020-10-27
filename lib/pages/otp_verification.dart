import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _OtpVerification();
  }
}

class _OtpVerification extends State<OtpVerification>{
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Center(
                  child: Image(
                    image: AssetImage('assets/otp_verification_image.png'),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape:  BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero
                          )
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                PinCodeTextField(
                                appContext: context,
                                  pastedTextStyle: TextStyle(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  length: 4,

                                  obscureText: false,
                                  obscuringCharacter: '*',
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    if (v.length < 3) {
                                      return "Dun Dun Dun";
                                    } else {
                                      return null;
                                    }
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 60,
                                    fieldWidth: 50,
                                    selectedFillColor: Color(0xFF0A287E),
                                    activeFillColor:
                                    hasError ? Colors.orange : Colors.white,
                                  ),
                                  cursorColor: Colors.black,
                                  animationDuration: Duration(milliseconds: 300),
                                  textStyle: TextStyle(fontSize: 20, height: 1.6),
                                  backgroundColor: Colors.blue.shade50,
                                  enableActiveFill: true,
                                  controller: textEditingController,
                                  errorAnimationController: errorController,
                                  keyboardType: TextInputType.number,
                                  boxShadows: [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                  onCompleted: (v) {
                                    print("Completed");
                                  },
                                  // onTap: () {
                                  //   print("Pressed");
                                  // },
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      currentText = value;
                                    });
                                  },
                                  beforeTextPaste: (text) {
                                    print("Allowing to paste");
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
