import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/inferencePage.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class HandlingPageState extends State<HandlingPage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Categories of Accessory: ",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tooltip(
                  message: "To suggest accessory based on accessory category",
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
                  "Brakes",
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
                  "Monoshock",
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
                  "Fork",
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
          _categoryValue = "brakes";
          break;
        case 1:
          _categoryValue = "monoshock";
          break;
        case 2:
          _categoryValue = "fork";
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

class HandlingPage extends StatefulWidget {
  @override
  HandlingPageState createState() => HandlingPageState();
}
