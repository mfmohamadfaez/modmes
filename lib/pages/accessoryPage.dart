import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/cosmeticPage.dart';
import 'package:modmes/pages/handlingPage.dart';
import 'package:modmes/pages/inferencePage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class AccessoryPageState extends State<AccessoryPage> {
  WorkingMemory WM = globals.wm;
  List facts = new List();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  String _modelValue = "";
  String _accessoryValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mod-Motor Expert System'),
        ),
        body: accessoryPageBody(),
      ),
    );
  }

  Widget accessoryPageBody() {
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
                    "Motorcycle Model: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message: "To suggest accessory based on motorcycle model",
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
                  "Honda EX-5",
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
                  "Yamaha 135 LC",
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
                  "Yamaha Y15ZR",
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
                  "Honda RS150R",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),

            //ACCESSORY TYPE
            Padding(padding: EdgeInsets.all(8.0)),
            Divider(height: 5.0, color: Colors.black),
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Type of Accessory: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message: "To suggest accessory based on accessory type",
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
                  "Handling",
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
                  "Cosmetic",
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
          _modelValue = "model Honda EX-5";
          break;
        case 1:
          _modelValue = "model Yamaha 135 LC";
          break;
        case 2:
          _modelValue = "model Yamaha Y15ZR";
          break;
        case 3:
          _modelValue = "model Honda RS150R";
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          _accessoryValue = "handling"; //performance
          break;
        case 1:
          _accessoryValue = "cosmetic"; //accessories
          break;
      }
    });
  }

  void submit() {
    if (_modelValue.isNotEmpty && _accessoryValue.isNotEmpty) {
      globals.wm.addFact(facts[0]);
      globals.wm.addFact(_modelValue);
      globals.wm.addFact(_accessoryValue);
      if (_radioValue2 == 0)
        //handling page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HandlingPage()));
      else if (_radioValue2 == 1)
        //cosmetic
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CosmeticPage()));
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

class AccessoryPage extends StatefulWidget {
  @override
  AccessoryPageState createState() => AccessoryPageState();
}
