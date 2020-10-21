import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:delux_bakery/pages/splash_screen.dart';

import 'package:delux_bakery/pages/registration_page.dart';
import 'package:delux_bakery/pages/login_page.dart';

import 'home_widget.dart';
import 'report_widget.dart';
import 'notifs_widget.dart';
import 'user_widget.dart';
import 'punch_order.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(App());
}

var routes = <String, WidgetBuilder>{
  '/home': (context) => Home(),
  '/report':(context) => Report(),
  '/notifs':(context) => NotificationWidget(),
  '/user':(context) => Userwidget(),
  '/punch_order':(context) => PunchOrder(),
  '/login':(context) => LoginScreen(),
  '/register':(context) => RegistrationScreen()
};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}