import 'dart:core';

import 'package:modmes/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:modmes/pages/accessoryPage.dart';
import 'package:modmes/pages/maintenancePage.dart';
import 'package:modmes/pages/performancePage.dart';
import 'package:modmes/working_memory.dart';

class SecondPageState extends State<SecondPage> {
  int _serviceValue = -1;
  int _radioValue1 = -1;

  @override
  Widget build(BuildContext context) {
    globals.wm = new WorkingMemory();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mod-Motor Expert System'),
        ),
        body: service(),
      ),
    );
  }

  Widget service() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please answer the question below: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          Divider(height: 5.0, color: Colors.black),
          Padding(padding: EdgeInsets.all(8.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  "What kind of service you want to do for your motorcyle? ",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Tooltip(
                message: 'Type of service',
                verticalOffset: 20,

                child: IconButton(
                  icon: Icon(Icons.help_outline),
                  onPressed: () {
                    /* ... */
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                "Performance",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                "Accessories",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                "Maintenance",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          Divider(height: 5.0, color: Colors.black),
          Padding(padding: EdgeInsets.all(8.0)),
          RaisedButton(
            onPressed: submit,
            color: Colors.purpleAccent,
            child: Text(
              'Submit',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _serviceValue = 0; //performance
          break;
        case 1:
          _serviceValue = 1; //accessories
          break;
        case 2:
          _serviceValue = 2; //accessories
          break;
      }
    });
  }

  void submit() {
    if (_serviceValue == 0) {
      //performance
      globals.wm.addFact("performance upgrade");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PerformancePage()));
    } else if (_serviceValue == 1) {
      //accessories
      globals.wm.addFact("accessories");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AccessoryPage()));
    } else if (_serviceValue == 2) {
      //accessories
      globals.wm.addFact("maintenance");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MaintenancePage()));
    }
  }
}

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}
