/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class OrderPay extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return OrderPayState();
  }
}


TextEditingController payPriceController = TextEditingController();

class OrderPayState extends State<OrderPay> {

  String _currentSelectedValue = '';
  var _size = ['Cash', 'UPI', 'Unpaid'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Portal"),
          automaticallyImplyLeading: false,
        ),
        body: Form(

          child: ListView(
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 5.0),
                child: Row(children: <Widget>[
                  Text("Customer Name :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text("Test",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0)),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 5.0),
                child: Row(children: <Widget>[
                  Text("Total Price ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text("200",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0)),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 5.0),
                child: Row(children: <Widget>[
                  Text("Total Weight :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text("2",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0)),
                ]),
              ),
              Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0, top: 13.0),
                        child: Text(
                          "Select Payment Mode",
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

                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 5.0),
                child: Row(children: <Widget>[
                  Text("Payment Method :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text("$_currentSelectedValue",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0)),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 20.0, left: 20.0, right: 40.0),
                child: TextFormField(
                  controller: payPriceController,
                  keyboardType: TextInputType.number,

                  onChanged: (value) {
                    debugPrint('Something changed in Weight Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Pay Amount in Rs',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 90.0, right: 90.0),
                child: RaisedButton(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'SUBMIT',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () async {
                      }),
              ),
            ],
          ),
        ));
  }
}*/