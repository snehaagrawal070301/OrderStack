

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {


  addItems(orderItems, shopName) async {
    return await FirebaseFirestore.instance
        .collection("Order")
        .doc(shopName).collection("Items").doc()
        .set(orderItems);
  }

  addItem(orderItems) async {
    return await FirebaseFirestore.instance
        .collection("Cart")
        .doc("items")
        .set(orderItems);
  }

  getMemberMobile(String number) async {
    return await FirebaseFirestore.instance
        .collection("customer")
        .where("number", isEqualTo: number)
        .get();
  }
  totalPrice(totalPrice) async{
    return await FirebaseFirestore.instance.collection("total").doc("price").set(totalPrice);
  }
  updatePrices(updatedPrice) async {
    return await FirebaseFirestore.instance.collection("total").doc("price").update(updatedPrice);
  }
  getCredential() async {
    return await FirebaseFirestore.instance.collection("Login").get();
  }

}

