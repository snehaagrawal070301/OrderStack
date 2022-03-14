/*import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_stack/OrderPay.dart';


DateTime _currentdate = new DateTime.now();
String str = new DateFormat.yMMMd().format(_currentdate);

class New4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return New4States();
  }
}

class New4States extends State<New4> {
  var _formkey = GlobalKey<FormState>();

  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController schemeController = TextEditingController();
  String _currentSelectedValue = '250 GM';
  var _size = ['250 GM', '500 GM', '1 KG'];
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        appBar: AppBar(
          title: Text("appbardetail"),
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  // Second Element

                  //element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,

                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Price Text Field');
                      },
                      decoration: InputDecoration(
                          labelText: 'Price(in INR)',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  //Second Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: TextFormField(
                      controller: weightController,
                      style: textStyle,
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                          labelText: 'Weight in KG',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  //Third Element

                  Card(
                      elevation: 3.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, top: 3.0),
                            child: Text(
                              "Select Packaging Size",
                              style: TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: _size.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              iconSize: 38.0,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500),

                              value: _currentSelectedValue,
                            ),
                          ),
                        ],
                      )),

                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      controller: schemeController,
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Scheme Text Field');
                      },
                      decoration: InputDecoration(
                          labelText: 'Scheme',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),

                  // Fourth Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'ADD ITEMS',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return OrderPay();
                              }));
                            }
                          ),
                        ),
                      ],
                    ),
                  ),

//Submit Button button
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'SUBMIT',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return OrderPay();
                              }));
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}*/