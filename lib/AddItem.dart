import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/services/DatabaseMethods.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController itemType = TextEditingController();
  TextEditingController itemUnit = TextEditingController();
  TextEditingController itemQuantity = TextEditingController();
  String code="";
  String mobile = "";
  String memberID="";
  QuerySnapshot? querySnapshot;
  TextEditingController memberId = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();
  int id=1;

  addItemDetails() async {
    if (formKey.currentState!.validate()) {


        CollectionReference users =
        FirebaseFirestore.instance.collection('item');
        await users.doc().set({
          "itemName":itemName.text,
          "itemPrice":itemPrice.text,
          "itemType":itemType.text,
          "itemUnit":itemUnit.text,
          "itemQuantity":itemQuantity.text,
        });
        getToast(context, "Item successfully added");
      // else {
        //print("already added");
        //getToast(context,"Already Added");
      //}
    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(ColorValues.THEME_COLOR),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: Mq.width(context) / 23.43, vertical: 20),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: Mq.height(context)*0.06,
                        width: Mq.height(context)*0.06,
                        decoration: BoxDecoration(
                          color: Color(ColorValues.WHITE_COLOR),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.arrow_back,color: Color(ColorValues.THEME_COLOR),)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),child:myText("Add Item",
                      size: Mq.height(context) * 0.03,
                      color:  Color(ColorValues.WHITE_COLOR),)),]),
                  SizedBox(
                    height: Mq.height(context) * 0.04,
                  ),
                  myText("Enter Product Name",
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
                        controller: itemName,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product name",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
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
                        controller: itemType,
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
                        controller: itemPrice,
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
                        controller: itemUnit,
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
                        controller: itemQuantity,
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
                  
                  SizedBox(
                    height: Mq.height(context) * 0.03,
                  ),
                  GestureDetector(
                      onTap: () {
                        addItemDetails();
                      },
                      child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              color: Color(ColorValues.WHITE_COLOR),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: myText("Add Item",
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
