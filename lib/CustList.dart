/*import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_stack/ListsNew.dart';

class CustList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustListState();
  }
}

class CustListState extends State<CustList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("person"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              /*Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Screen1()),
                (Route<dynamic> route) => false,
              );*/
            },
            child: Text("Main Screen"),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(person),
                  ));*/
            },
          ),
        ],
      ),
      body: ListView(children: [
        Card(
        elevation: 8.0,
        child: new ListTile(
          title: new Text('Name'),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 25.0,
          ),
          contentPadding: EdgeInsets.all(20.0),
          onTap: () {
             Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ListsNew(

                          );
                        }));
          },
        ),
      ),
        Card(
          elevation: 8.0,
          child: new ListTile(
            title: new Text('Name'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 25.0,
            ),
            contentPadding: EdgeInsets.all(20.0),
            onTap: () {
               Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ListsNew(

                          );
                        }));
            },
          ),
        )
      ],)
    );
  }
}*/
