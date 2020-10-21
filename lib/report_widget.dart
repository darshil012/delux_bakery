import 'package:flutter/material.dart';

class Report extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ReportState();
  }
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: (){Navigator.pushNamed(context, '/punch_order');},
        child: new Icon(Icons.bakery_dining),
        backgroundColor: Colors.redAccent,
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined,color: Colors.indigo,), onPressed: (){},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications), onPressed: (){Navigator.pushNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}