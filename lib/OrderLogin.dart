/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/CustList.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrderLogin extends StatefulWidget {
  OrderLogin();

  @override
  State<StatefulWidget> createState() {
    return OrderLoginPage();
  }
}

class OrderLoginPage extends State<OrderLogin> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController emailControlled = TextEditingController();
  TextEditingController passwordControlled = TextEditingController();
  String username = "orderstackadmin";
  String password = "123";


  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Order Stack(Seller)'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Center(
            child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: textStyle,
                      controller: emailControlled,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.pink,
                          ),
                          labelText: "UserID",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: textStyle,
                      controller: passwordControlled,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.pink,
                        ),
                        labelText: "Password",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CustList();
                          }),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(30.0)),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Verify",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}*/
