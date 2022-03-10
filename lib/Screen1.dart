

import 'package:flutter/material.dart';
import 'package:order_stack/MasterLogin.dart';
import 'package:order_stack/OrderLogin.dart';


class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen1State();
  }
}

class Screen1State extends State<Screen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Stack"),
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 120.0, left: 50.0),
            child: Text(
              "ORDER STACK",
              textScaleFactor: 3.0,
            ),
          ),
          SizedBox(height: 50.0),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: RaisedButton(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "Order",
                        textScaleFactor: 1.5,
                      ),
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return OrderLogin();
                          }),
                        );
                      })),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: RaisedButton(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "Sales",
                        textScaleFactor: 1.5,
                      ),
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                       /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SalesLogin();
                          }),
                        );*/
                      })),
              SizedBox(width: 10.0),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Expanded(
                child: RaisedButton(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Add",
                      textScaleFactor: 1.5,
                    ),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MasterLogin();
                        }),
                      );
                    }),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: RaisedButton(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "View",
                      textScaleFactor: 1.5,
                    ),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ViewLogin();
                        }),
                      );*/
                    }),
              ),
              SizedBox(width: 10.0),
            ],
          ),
        ]));
  }
}
