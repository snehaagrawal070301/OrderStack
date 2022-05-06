// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/components/colorValues.dart';

class OrderSummary extends StatefulWidget {
  var shopName,totalPrice;
  OrderSummary(this.shopName,this.totalPrice);
  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  @override
  void initState() {
    super.initState();
    _fetch();
  }
  List<dynamic> itemName = List<dynamic>.empty(growable: true);
  List<dynamic> itemPrice = List<dynamic>.empty(growable: true);
  List<dynamic> itemQuantity = List<dynamic>.empty(growable: true);
  List<dynamic> itemUnit = List<dynamic>.empty(growable: true);
  List<dynamic> itemType = List<dynamic>.empty(growable: true);
  //List<dynamic> itemTotalPrice = List<dynamic>.empty(growable: true);
  var totalPrice;
  _fetch() async {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Order").doc(widget.shopName).collection("Items").get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];

        print(a.get("itemName"));
        itemName.add(a.get("itemName"));

        itemPrice.add(a.get("itemPrice"));
        itemQuantity.add(a.get("itemQuantity"));
        itemUnit.add(a.get("itemUnit"));
      //  var tot=double.parse(a.get("itemPrice"))*double.parse(a.get("itemQuantity"));

   //     itemTotalPrice.add(tot.toString());



      }

    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorValues.THEME_COLOR),
      appBar: AppBar(
        title: Text("Order Summary"),

      ),
    body: Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            child: Row(children: <Widget>[
              Text("Shop Name  ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              Text(widget.shopName,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color:Color(ColorValues.WHITE),)),
            ]),
          ),
          SizedBox(height: 20.0,),
          Text("Items List  ",
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
         Row(
           children: [
             ViewList(itemName),
             ViewList(itemQuantity),
           ViewList(itemPrice),
            // ViewList(itemTotalPrice),


           ],
         ),
          //SizedBox(height: 20.0,),
        /*  Padding(

            padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            child: Row(children: <Widget>[
              Text("Total Bill  ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              Text(widget.totalPrice,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color:Color(ColorValues.WHITE),)),
            ]),
          ),*/
        ],
      ),
    ),
    );
  }
}
class ViewList extends StatelessWidget {
  var itemName;

  ViewList(this.itemName);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200.0,
        child: ListView.builder(
            itemCount: itemName.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(itemName[index]),
              );
            }),
      ),
    );
  }
}