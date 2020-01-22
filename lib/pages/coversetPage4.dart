import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/inferencePage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class CoversetPage4State extends State<CoversetPage4> {
  //model HONDA RS150R

  WorkingMemory WM = globals.wm;
  List facts = new List();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  String _colorValue = "";

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
              "Coverset color: ",
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
                  "Black",
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
                  "White",
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
                  "Blue",
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
                  "Silver",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 4,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                Text(
                  "Yellow",
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
          _colorValue = "black";
          break;
        case 1:
          _colorValue = "white";
          break;
        case 2:
          _colorValue = "blue";
          break;
        case 3:
          _colorValue = "silver";
          break;
        case 4:
          _colorValue = "yellow";
          break;
      }
    });
  }

  void submit() {
    if (_colorValue.isNotEmpty) {
      globals.wm.addFact(facts[0]);
      globals.wm.addFact(facts[1]);
      globals.wm.addFact(facts[2]);
      globals.wm.addFact(facts[3]);
      globals.wm.addFact(_colorValue);
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

class CoversetPage4 extends StatefulWidget {
  @override
  CoversetPage4State createState() => CoversetPage4State();
}
