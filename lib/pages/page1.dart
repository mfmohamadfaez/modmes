import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/pages/page2.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _startButton(context),
      ),
    );
  }

  Widget _startButton(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'MOD-MOTOR',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
                Text(
                  'EXPERT SYSTEM',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
                Text(
                  '(MODMES)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              child: FlatButton(
                  autofocus: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.purple,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.purpleAccent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                  child: Text('START', style: TextStyle(fontSize: 48))),
            )
          ],
        ));
  }
}
