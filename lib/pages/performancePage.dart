import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/inferencePage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class PerformancePageState extends State<PerformancePage> {
  WorkingMemory WM = globals.wm;
  List facts = new List();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  String _rangeValue = "";
  String _modificationValue = "";
  String _motorcycleValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mod-Motor Expert System'),
        ),
        body: performancePageBody(),
      ),
    );
  }

  Widget performancePageBody() {
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
                    "What is your budget range? ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message: 'To suggest the items based on budget.',
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
                  "RM180-RM500",
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
                  "RM501-RM1000",
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
                  "RM1001-RM2000",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                Text(
                  "RM2001-RM3000",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),

            //MODIFICATION
            Padding(padding: EdgeInsets.all(8.0)),
            Divider(height: 5.0, color: Colors.black),
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "What is your type of modification? ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message: "To suggest items based on modification type",
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
                  groupValue: _radioValue2,
                  onChanged: _handleRadioValueChange2,
                ),
                Text(
                  "Daily",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _radioValue2,
                  onChanged: _handleRadioValueChange2,
                ),
                Text(
                  "Weekend",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: _radioValue2,
                  onChanged: _handleRadioValueChange2,
                ),
                Text(
                  "Track",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),

            //MOTORCYCLE
            Padding(padding: EdgeInsets.all(8.0)),
            Divider(height: 5.0, color: Colors.black),
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "What is your motorcycle type?",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Tooltip(
                  message: 'To suggest items based on motorcycle type',
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
                  groupValue: _radioValue3,
                  onChanged: _handleRadioValueChange3,
                ),
                Text(
                  "Fuel Injection",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _radioValue3,
                  onChanged: _handleRadioValueChange3,
                ),
                Text(
                  "Carburetor",
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
          _rangeValue = "between RM180 and RM500";
          break;
        case 1:
          _rangeValue = "between RM501 and RM1000";
          break;
        case 2:
          _rangeValue = "between RM1001 and RM2000";
          break;
        case 3:
          _rangeValue = "between RM2001 and RM3000";
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          _modificationValue = "daily"; //performance
          break;
        case 1:
          _modificationValue = "weekend"; //accessories
          break;
        case 2:
          _modificationValue = "track"; //accessories
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          _motorcycleValue = "fuel injection"; //performance
          break;
        case 1:
          _motorcycleValue = "carburetor"; //accessories
          break;
      }
    });
  }

  void submit() {
    if (_rangeValue.isNotEmpty &&
        _modificationValue.isNotEmpty &&
        _motorcycleValue.isNotEmpty) {
      globals.wm.addFact(facts[0]);
      globals.wm.addFact(_rangeValue);
      globals.wm.addFact(_modificationValue);
      globals.wm.addFact(_motorcycleValue);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InferencePage()));
    }
    else{
      showDialog(
          context: context,
          builder: (_) =>
          new AlertDialog(
            title: new Text("ERROR"),
            content: new Text("Please answer all the question(s)"),
          )
      );
    }
  }
}

class PerformancePage extends StatefulWidget {
//  static const routeName = '/performancePage';

  @override
  PerformancePageState createState() => PerformancePageState();
}
