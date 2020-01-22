import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/majorPage.dart';
import 'package:modmes/pages/minorPage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class MaintenancePageState extends State<MaintenancePage> {
  WorkingMemory WM = globals.wm;
  List facts = new List();
  int _radioValue1 = -1;
  String _maintenanceValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mod-Motor Expert System'),
        ),
        body: maintenancePageBody(),
      ),
    );
  }

  Widget maintenancePageBody() {
    facts = WM.facts;

    return SingleChildScrollView(
      child: Container(
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
                    "Type of maintenance: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message:
                      "To suggest maintenance task based on maintenance type",
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
                  "Major Maintenance",
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
                  "Minor Maintenance",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),

            //SUBMIT BUTTON
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
      ),
    );
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _maintenanceValue = "major";
          break;
        case 1:
          _maintenanceValue = "minor";
          break;
      }
    });
  }

  void submit() {
    if (_maintenanceValue.isNotEmpty) {
      globals.wm.addFact(facts[0]);
      globals.wm.addFact(_maintenanceValue);
      if (_radioValue1 == 0)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MajorPage()));
      else if (_radioValue1 == 1)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MinorPage()));
    } else {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("ERROR"),
                content: new Text("Please answer all the question(s)"),
              ));
    }
  }
}

class MaintenancePage extends StatefulWidget {
  @override
  MaintenancePageState createState() => MaintenancePageState();
}
