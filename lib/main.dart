import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/knowledge-based.dart';
import 'package:modmes/pages/page1.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mod-Motor Expert System',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: FirstPage(),
    );
  }
}