import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modmes/inference_engine.dart';
import 'package:modmes/knowledge-based.dart';
import 'package:modmes/working_memory.dart';
import 'package:modmes/globals.dart' as globals;

class InferencePage extends StatelessWidget {
  KnowledgeBase KB = new KnowledgeBase();
  WorkingMemory WM = globals.wm;
  InferenceEngine IE = new InferenceEngine();
  List rules;


  @override
  Widget build(BuildContext context) {
    rules = KB.getRules();
    List facts = WM.facts;
    /*String s = "";
    rules.forEach((rList) {
      for (int i = 0; i < rList.length; i++) {
        s += rList[i];
      }
    });

    String s1 = "";
    facts.forEach((fList) {
      for (int j = 0; j < facts.length; j++) {
        s1 += fList[j];
      }
    });*/

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Mod-Motor Expert System'),
          ),
          body: inferencePageBody(context)),
    );
  }

  Widget inferencePageBody(BuildContext context) {
    List usedRule = IE.getConclusion(KB, WM);
    String _conclusion = usedRule[0];
    String how = "";
    String c1,c2,c3,c4,c5;
    for (int j = 1; j < usedRule.length; j++) {
      int ind = usedRule[j];
      List r = rules[ind - 1];

      for (String rl in r) {
        if (rl == "maintenance") {
          c1=r[0];
          c2=r[1];
          c3=r[2];
          c4=r[3];

          how = "BECAUSE..."+
              "\n- THE TYPE OF SERVICE IS "+c1.toUpperCase()+
              "\n- THE TYPE OF MAINTENANCE IS "+c2.toUpperCase() +
              "\n- MAINTENANCE PART IS "+c3.toUpperCase();
          break;
        }
        else if (rl == "performance upgrade") {
          c1=r[0];
          c2=r[1];
          c3=r[2];
          c4=r[3];
          c5=r[4].replaceAll("recommended upgrade are","");

          how = "BECAUSE..."+
              "\n- THE TYPE OF SERVICE IS "+c1.toUpperCase()+
              "\n- THE BUDGET RANGE IS "+c2.toUpperCase() +
              "\n- THE TYPE OF MODIFICATION IS "+c3.toUpperCase()+
              "\n- THE TYPE OF MOTROCYCLE IS "+c4.toUpperCase();
          break;

        }
        else if (rl == "accessories") {
          c1=r[0];
          c2=r[1];
          c3=r[2];
          c4=r[3];
          c5=r[4];

          how = "BECAUSE..."+
              "\n- THE TYPE OF SERVICE IS "+c1.toUpperCase()+
              "\n- THE MOTORCYCLE MODEL IS "+c2.toUpperCase() +
              "\n- THE TYPE OF ACCESSORY IS "+c3.toUpperCase()+
              "\n- THE CATEGORY OF ACCESSORY IS "+c4.toUpperCase();
          break;

        }

        /*else if (rl == "change pilot jet and float"
        || rl == "engine need overhaul"
        || rl == "clean the fuel injector") {
          c1=r[0];
          c2=r[1];

          how = how + "\n\nRULE "+ind.toString()+ " : "+
              "\nIF "+c1.toUpperCase()+
              "\nTHEN "+c2.toUpperCase();
          break;

        }*/
      }

      //IF the type of services is performance upgrade
      //
      //AND the budget is between 180 and 500
      //
      //AND the type of modification is weekend
      //
      //AND the type of motorcycle is fuel injection
      //
      //THEN the items that can be upgrade is plug, air filter, water coolant and tensional manual
    }

    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.flag),
                    title: Text('CONCLUSION'),
                    subtitle: Text(
                      _conclusion,
                    )),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      Tooltip(
                        message: 'HOW',
                        child: FlatButton(
                          child: const Text('HOW'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                new AlertDialog(
                                  title: new Text("HOW EXPLAINATION"),
                                  content: new Text(how),
                                )
                            );
                            /* ... */
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
