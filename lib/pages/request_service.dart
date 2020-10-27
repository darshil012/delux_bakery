import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:delux_bakery/components/user_appbar.dart';
import 'package:delux_bakery/components/user_drawer.dart';

class RequestServices extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _RequestServices();
  }
}

class _RequestServices extends State<RequestServices>{
  String _value = DateTime.now().toString();

  String dropdownValue;

  final dateFormat = DateFormat("dd/MM/yyyy");

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: UserAppBar(),
      drawer: UserDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFF4F5FC)
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Services Request',
                        style: TextStyle(
                            color: Color(0xFF1C3787),
                            fontWeight: FontWeight.w800,
                            fontSize: 24
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                        iconSize: 24,
                        elevation: 16,
                        decoration: InputDecoration(
                          hintText: 'Select Action',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 8.0, left: 10),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        style: TextStyle(color: Colors.indigo),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Three', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                        iconSize: 24,
                        elevation: 16,
                        decoration: InputDecoration(
                          hintText: 'Select Product',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 8.0, left: 10, bottom: 8.0),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        style: TextStyle(color: Colors.indigo),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Three', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                maxLines: 10,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: 'Text Here...',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide()
                                  ),
                                  contentPadding: EdgeInsets.only(top: 8.0, left: 10),

                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width*0.50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C3787),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Colors.black45,
                      blurRadius: 2,
                      offset: Offset(1,1),
                    )],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Send Request',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){Navigator.pushNamed(context, '/punch_order');},
        child: Image(
          image: AssetImage('assets/ico-hand.png'),
          width: 25,
        ),
        backgroundColor: Color(0xFFE4001B),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home,), onPressed: (){Navigator.pushNamed(context, '/home');},)),
            Expanded(child: IconButton(icon: Icon(Icons.text_snippet_outlined, color: Color(0xFF0A287E),), onPressed: (){},)),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.notifications,), onPressed: (){Navigator.pushReplacementNamed(context, '/notifs');},)),
            Expanded(child: IconButton(icon: Icon(Icons.person), onPressed: (){Navigator.pushNamed(context, '/user');},)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 3,
        child: DateTimeField(

          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_today),
            labelText: 'dd/MM/yyyy',
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 8.0, left: 2),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          'To',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        flex: 3,
        child: DateTimeField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_today),
            labelText: 'dd/MM/yyyy',
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 8.0, left: 2),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
      ),
    ]);
  }
}