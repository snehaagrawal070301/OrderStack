import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/ItemsList.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/services/DatabaseMethods.dart';

class GenerateOrder extends StatefulWidget {
  const GenerateOrder({Key? key}) : super(key: key);

  @override
  State<GenerateOrder> createState() => _GenerateOrderState();
}

class _GenerateOrderState extends State<GenerateOrder> {
  var customerNames;
  var displayCustomerName;
  DatabaseMethods databaseMethods = DatabaseMethods();
  var shopName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Generate Order",
                        size: Mq.height(context) * 0.03,
                        color: Color(ColorValues.WHITE_COLOR),
                      )),
                ]),
                SizedBox(
                  height: Mq.height(context) * 0.04,
                ),
                myText("Add Customer",
                    size: Mq.height(context) * 0.020,
                    color: Color(ColorValues.WHITE_COLOR),
                    fontWeight: FontWeight.w500),
                Container(
                    height: MediaQuery.of(context).size.height / 14,
                   // width:  MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.01,
                        bottom: Mq.height(context) * 0.01,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('customer')
                            .orderBy('name')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) return Container();
                          /*if (setDefaultMake) {
                            customerNames = snapshot.data.docs[0].get('name');
                            debugPrint('setDefault make: $carMake');
                          }*/
                          return DropdownButton(
                            isExpanded: true,
                            value: displayCustomerName,
                            alignment: Alignment.bottomRight,
                            items: snapshot.data!.docs.map((value) {
                              return DropdownMenuItem(
                                value: value.get('shopName'),
                                child: Text('${value.get('shopName')}'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              debugPrint('selected onchange: $value');
                               setState(
                                () {
                                  debugPrint('make selected: $value');
                                  // Selected value will be stored
                                  displayCustomerName = value;
                                  shopName=value;
                                  // Default dropdown value won't b``e displayed anymore
                                //  setDefaultMake = false;
                                  // Set makeModel to true to display first car from list
                                  //setDefaultMakeModel = true;
                                },
                              );
                            },
                          );
                        })),
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ItemsList(shopName);
                        }),
                      );
                    },
                    child: Container(
                        height: Mq.height(context) * 0.06,
                        width: Mq.height(context) * 0.06,
                        decoration: BoxDecoration(
                          color: Color(ColorValues.WHITE_COLOR),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(ColorValues.THEME_COLOR),
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: myText(
                        "Add Item",
                        size: 14,
                        color: Color(ColorValues.WHITE_COLOR),
                      )),
                ]),
                SizedBox(
                  height: Mq.height(context) * 0.03,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: Color(ColorValues.WHITE_COLOR),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: myText("Save Order",
                              size: Mq.height(context) * 0.024,
                              color: Color(ColorValues.THEME_COLOR),
                              fontWeight: FontWeight.w400),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }


}
