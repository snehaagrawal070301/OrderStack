// ignore_for_file: must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/OrderSummary.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
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
          backgroundColor: Color(ColorValues.THEME_COLOR),
          body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: Mq.width(context) / 23.43, vertical: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  Row(children: [
                  GestureDetector(
                  onTap: () {
                Navigator.pop(context);
                },
                  child: Container(
                      height: Mq.height(context) * 0.06,
                      width: Mq.height(context) * 0.06,
                      decoration: BoxDecoration(
                        color: Color(ColorValues.WHITE_COLOR),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(ColorValues.THEME_COLOR),
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: myText(
                      "Order Items Details",
                      size: Mq.height(context) * 0.03,
                      color: Color(ColorValues.WHITE_COLOR),
                    )),
                ]),
            SizedBox(
              height: Mq.height(context) * 0.04,
            ),
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
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Item Name :  ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
                Text(widget.itemName,
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Item Price. :  ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
                Text(widget.itemPrice,
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Item Quantity :  ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
                Text(widget.itemQuantity,
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text(" Item Unit:  ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
                Text(widget.itemUnit,
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Item Type :  ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
                Text(widget.itemType,
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0,color: Color(ColorValues.WHITE),)),
              ]),
            ),
            TextFormField(
              controller: itemQuantity,
              style: TextStyle(color: Color(ColorValues.WHITE),),
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
                                totalPrice.toString()
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
                        color: Color(ColorValues.WHITE),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Confirm",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontSize: 20, color: Color(ColorValues.THEME_COLOR),),
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
                        color: Color(ColorValues.WHITE),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Add Items",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(ColorValues.THEME_COLOR),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
           ] )
          ),

    )
  )
  );
  }
}
