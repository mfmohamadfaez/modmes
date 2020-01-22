import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/coversetPage1.dart';
import 'package:modmes/pages/coversetPage2.dart';
import 'package:modmes/pages/coversetPage3.dart';
import 'package:modmes/pages/coversetPage4.dart';
import 'package:modmes/pages/inferencePage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class CosmeticPageState extends State<CosmeticPage> {
  WorkingMemory WM = globals.wm;
  List facts = new List();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  String _categoryValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mod-Motor Expert System'),
        ),
        body: handlingPageBody(),
      ),
    );
  }

  Widget handlingPageBody() {
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
            Text(
              "Categories of Accessory: ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                  "Coverset",
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
                  "Lock",
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
                  "Basket",
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
          _categoryValue = "coverset";
          break;
        case 1:
          _categoryValue = "lock";
          break;
        case 2:
          _categoryValue = "basket";
          break;
      }
    });
  }

  void submit() {
    if (_categoryValue.isNotEmpty) {
      globals.wm.addFact(facts[0]);
      globals.wm.addFact(facts[1]);
      globals.wm.addFact(facts[2]);
      globals.wm.addFact(_categoryValue);
      if (_categoryValue == "coverset") {
        if (facts[1] == "model Honda EX-5")
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoversetPage1()));
        else if (facts[1] == "model Yamaha 135 LC")
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoversetPage2()));
        else if (facts[1] == "model Yamaha Y15ZR")
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoversetPage3()));
        else if (facts[1] == "model Honda RS150R")
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoversetPage4()));
      } else
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InferencePage()));
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

class CosmeticPage extends StatefulWidget {
  @override
  CosmeticPageState createState() => CosmeticPageState();
}
