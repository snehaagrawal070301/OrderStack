import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/services/DatabaseMethods.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';

class GenerateOrder extends StatefulWidget {
  const GenerateOrder({Key? key}) : super(key: key);

  @override
  State<GenerateOrder> createState() => _GenerateOrderState();
}

class _GenerateOrderState extends State<GenerateOrder> {
  var customerNames;
  var displayCustomerName;
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
                                value: value.get('name'),
                                child: Text('${value.get('name')}'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              debugPrint('selected onchange: $value');
                               setState(
                                () {
                                  debugPrint('make selected: $value');
                                  // Selected value will be stored
                                  displayCustomerName = value;
                                  // Default dropdown value won't b``e displayed anymore
                                //  setDefaultMake = false;
                                  // Set makeModel to true to display first car from list
                                  //setDefaultMakeModel = true;
                                },
                              );
                            },
                          );
                        })),
                myText("Enter Product Type",
                    size: Mq.height(context) * 0.020,
                    color: Color(ColorValues.WHITE_COLOR),
                    fontWeight: FontWeight.w500),
                Container(
                  height: MediaQuery.of(context).size.height / 14,
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
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      style: inputStyle(context),
                      decoration: InputDecoration(
                        hintText: "Product type",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.headline5!.color),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                myText("Enter Product Price",
                    size: Mq.height(context) * 0.020,
                    color: Color(ColorValues.WHITE_COLOR),
                    fontWeight: FontWeight.w500),
                Container(
                  height: MediaQuery.of(context).size.height / 14,
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
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: inputStyle(context),
                      decoration: InputDecoration(
                        hintText: "Product price",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.headline5!.color),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                myText("Enter Product Unit",
                    size: Mq.height(context) * 0.020,
                    color: Color(ColorValues.WHITE_COLOR),
                    fontWeight: FontWeight.w500),
                Container(
                  margin: EdgeInsets.only(
                      top: Mq.height(context) * 0.015,
                      bottom: Mq.height(context) * 0.02),
                  padding: EdgeInsets.only(
                      left: Mq.width(context) * 0.02,
                      top: Mq.height(context) * 0.005,
                      bottom: Mq.height(context) * 0.005,
                      right: Mq.width(context) * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).dividerColor, width: 0.4),
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      style: inputStyle(context),
                      decoration: InputDecoration(
                        hintText: "Product unit",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.headline5!.color),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                myText("Enter Product Quantity",
                    size: Mq.height(context) * 0.020,
                    color: Color(ColorValues.WHITE_COLOR),
                    fontWeight: FontWeight.w500),
                Container(
                  margin: EdgeInsets.only(
                      top: Mq.height(context) * 0.015,
                      bottom: Mq.height(context) * 0.02),
                  padding: EdgeInsets.only(
                      left: Mq.width(context) * 0.02,
                      top: Mq.height(context) * 0.005,
                      bottom: Mq.height(context) * 0.005,
                      right: Mq.width(context) * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).dividerColor, width: 0.4),
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: inputStyle(context),
                      decoration: InputDecoration(
                        hintText: "Product quantity",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.headline5!.color),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      _bottomSheet(context);
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
  _bottomSheet(context) {
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(ColorValues.WHITE_COLOR),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                    const EdgeInsets.only(top: 20, left: 17, bottom: 15),
                    child: Text(
                      "Add Item",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff000000),
                        fontFamily: "Regular",
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Color(ColorValues.BLACK_COLOR),
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 30, bottom: 10, left: 25, right: 25),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      height: 35,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          color: Color(ColorValues.THEME_COLOR),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                            "Continue with Phone",
                            style: TextStyle(
                              color: Color(ColorValues.WHITE_COLOR),
                              fontFamily: "Regular",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 35,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Color(ColorValues.BLACK_COLOR)),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 52),
                          child: Image(
                            image: AssetImage("assets/images/googleIcon.png"),
                            height: 14,
                            width: 14,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Continue with Google",
                              style: TextStyle(
                                color: Color(ColorValues.BLACK_COLOR),
                                fontFamily: "Regular",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(ColorValues.BLACK_TEXT_COL),
                              fontFamily: "Regular",
                            ),
                            textAlign: TextAlign.center,
                          ))),
                ],
              ),
            ),
          );
        });
  }

}
