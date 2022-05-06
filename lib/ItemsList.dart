// ignore_for_file: must_be_immutable

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/AddOrderItems.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
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
        backgroundColor: Color(ColorValues.THEME_COLOR),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 45,
          leading:  GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(

              margin: EdgeInsets.only(left: 10),
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
          title: Text("Items List",style: TextStyle(color:Color(ColorValues.WHITE), ),),
          backgroundColor:  Color(ColorValues.THEME_COLOR),
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
                  return Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: new ListView(
                      children: snapshot.data!.docs
                          .map((DocumentSnapshot document) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal:14),
                          child: Card(
                            elevation: 8.0,
                            child: new ListTile(
                              title: new Text('${document['itemName']}',style: TextStyle(color:Color(ColorValues.THEME_COLOR), ),),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 25.0,
                                color:Color(ColorValues.THEME_COLOR),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
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
                          ),
                        );
                      }).toList(),
                    ),
                  );
              }
            }));
  }
}