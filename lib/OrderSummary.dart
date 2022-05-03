// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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


      }
      print(itemQuantity);
      print(itemName);
      print(widget.shopName);
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
        backgroundColor: Colors.purple,
      ),);
  }
}
