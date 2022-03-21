/*import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Screen1.dart';
import 'package:intl/intl.dart';

TextEditingController nameController = TextEditingController();

TextEditingController mobileController = TextEditingController();
TextEditingController addController = TextEditingController();


class Screen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen3State();
  }
}

class Screen3State extends State<Screen3> {
  var _formkeys = GlobalKey<FormState>();
  static var count, countNew, fields;
  DateTime _currentdate = new DateTime.now();

  //Same
  @override
  Widget build(BuildContext context) {
    String _formatDate = new DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Customer"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
               /* Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Screen1()),
                      (Route<dynamic> route) => false,
                );*/
              },
              child: Text("Main Screen"),
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
              key: _formkeys,
              child: ListView(children: <Widget>[
                TextFormField(
                  controller: nameController,

                  onChanged: (value) {
                    debugPrint('Something changed in Name Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Name of Customer',
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.grey[900],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),

                //Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: mobileController,

                    onChanged: (value) {
                      debugPrint('Something changed in Date Text Field');
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.grey[900],
                        ),
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextFormField(
                    controller: addController,

                    onChanged: (value) {
                      debugPrint('Something changed in Bill Text Field');
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color: Colors.grey[900],
                        ),
                        labelText: 'Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      'Date:$_formatDate',
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 25.0, bottom: 25.0, left: 60.0, right: 60.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Add to MasterList',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () async {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}*/