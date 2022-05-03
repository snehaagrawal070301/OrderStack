// ignore_for_file: must_be_immutable

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/AddOrderItems.dart';
class ItemsList extends StatefulWidget {
  String shopName;
  ItemsList(this.shopName);
  @override
  ItemsListState createState() => ItemsListState();
}

class ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection('item').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                      return Card(
                        elevation: 8.0,
                        child: new ListTile(
                          title: new Text('${document['itemName']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return AddOrderItems(
                                    widget.shopName,
                                    document['itemName'].toString(),
                                    document['itemPrice'].toString(),
                                    document['itemQuantity'].toString(),
                                    document['itemUnit'].toString(),
                                    document['itemType'].toString()
                                  );
                                }));
                          },
                        ),
                      );
                    }).toList(),
                  );
              }
            }));
  }
}