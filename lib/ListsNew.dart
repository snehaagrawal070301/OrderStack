/*import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/New4.dart';

class ListsNew extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return ListNewState();
  }
}

class ListNewState extends State<ListsNew> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
          automaticallyImplyLeading: false,

        ),
        body: ListView(children: <Widget>[
          ListTile(
            leading: Icon(Icons.cloud_circle),
            title: Text("Urad Dal"),
            subtitle: Text("Best Quality"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return New4();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_circle),
            title: Text("Urad Dal"),
            subtitle: Text("Best Quality"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return New4();
              }));
            },
          ),
        ]));
  }
}*/