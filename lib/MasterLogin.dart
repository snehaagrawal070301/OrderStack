import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_stack/Screen3.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MasterLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MasterLoginPage();
  }
}


DateTime _currentdate = new DateTime.now();
String str = new DateFormat.yMMMd().format(_currentdate);

class MasterLoginPage extends State<MasterLogin> {
  var _formkey = GlobalKey<FormState>();
  var emailControlled = TextEditingController();
  var passwordControlled = TextEditingController();







  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Order Pack(Master Data)'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Center(
            child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: textStyle,
                      controller: emailControlled,

                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.pink,
                          ),
                          labelText: "UserId",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      onChanged: (val) {

                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: textStyle,
                      controller: passwordControlled,

                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.pink,
                        ),
                        labelText: "Password",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      height: 50.0,
                      child: RaisedButton(
                          color: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red)),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Screen3();
                              }),
                            );
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}
