// ignore_for_file: must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/OrderSummary.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/services/DatabaseMethods.dart';
class AddOrderItems extends StatefulWidget {
  String itemName,itemPrice,itemUnit,itemQuantity,itemType,shopName;
   AddOrderItems(this.shopName,this.itemName,this.itemPrice,this.itemUnit,this.itemQuantity,this.itemType);

  @override
  State<AddOrderItems> createState() => _AddOrderItemsState();
}

class _AddOrderItemsState extends State<AddOrderItems> {
DatabaseMethods databaseMethods = DatabaseMethods();
  generateOrder( orderItems, shopName) {
    databaseMethods.addItems(orderItems,shopName);
  }
totalBill(totalPrice){
  databaseMethods.totalPrice(totalPrice);
}

 @override
  void initState() {
    super.initState();
    _addPrice();
  }
  var totalPrice;
 _addPrice() async {
   var collection = FirebaseFirestore.instance.collection('total');
   var docSnapshot = await collection.doc('price').get();
   if (docSnapshot.exists) {
     Map<String, dynamic>? data = docSnapshot.data();
     totalPrice  = double.parse(data?['totalPrice']);

   }
 }
 updatePrice(updatedPrice){
   databaseMethods.updatePrices(updatedPrice);
 }
final formKey = GlobalKey<FormState>();
TextEditingController itemQuantity = TextEditingController();
Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text("Order Items Details"),
            backgroundColor: Colors.purple,
          ),
          body: Container(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Shop Name  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.shopName,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Item Name :  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.itemName,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Item Price. :  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.itemPrice,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Item Quantity :  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.itemQuantity,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text(" Item Unit:  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.itemUnit,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
                    child: Row(children: <Widget>[
                      Text("Item Type :  ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                      Text(widget.itemType,
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
                    ]),
                  ),
                  TextFormField(
                    controller: itemQuantity,
                    style: TextStyle(),
                    decoration: textFieldInputDecoration("Item Quantity"),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Map<String,String> orderItems = {

                              "itemName" : widget.itemName,
                              "itemPrice" : widget.itemPrice,
                              "itemQuantity" : itemQuantity.text,
                              "itemUnit" : widget.itemUnit,
                              "itemType" : widget.itemType

                            };
                            var qty=double.parse(widget.itemPrice);
                            var price =double.parse(itemQuantity.text);
                            var productOfPrice = qty*price;
                            totalPrice += productOfPrice;

                            generateOrder(orderItems,widget.shopName);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return OrderSummary(
                                      widget.shopName,
                                      totalPrice
                                  );
                                }));
                            Map<String,String> sumPrice={
                              "totalPrice" : "0",
                            };
                            updatePrice(sumPrice);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              "Confirm",
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.2,
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Map<String,String> orderItems = {

                                "itemName" : widget.itemName,
                                "itemPrice" : widget.itemPrice,
                                "itemQuantity" : itemQuantity.text,
                                "itemUnit" : widget.itemUnit,
                                "itemType" : widget.itemType

                            };
                            var qty=double.parse(widget.itemPrice);
                            var price =double.parse(itemQuantity.text);
                            var productOfPrice = qty*price;
                            totalPrice += productOfPrice;
                            Map<String,String> sumPrice={
                              "totalPrice" : totalPrice.toString(),
                            };
                            totalBill(sumPrice);
                            generateOrder(orderItems,widget.shopName);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              "Add Items",
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

    );
  }
}
