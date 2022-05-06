import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_stack/DistributorDashboard.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/services/DatabaseMethods.dart';

class DistributorLogin extends StatefulWidget {
  //final Function toggle;
  //SignIn(this.toggle);
  @override
  _DistributorLoginState createState() => _DistributorLoginState();
}

class _DistributorLoginState extends State<DistributorLogin> {
  final formKey = GlobalKey<FormState>();
  //final Function toggle;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();
  late QuerySnapshot querySnapshot;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  signIn() async {
    await databaseMethods.getCredential().then((val) {
      setState(() {
        querySnapshot = val;
      });
    });
    if (querySnapshot.docs[0].get("uid") == emailTextEditingController.text &&
        querySnapshot.docs[0].get("password") == passwordTextEditingController.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DistributorDashboard()),
      );
      emailTextEditingController.clear();
      passwordTextEditingController.clear();
    } else {
      scaffoldKey.currentState
      // ignore: deprecated_member_use
          ?.showSnackBar(new SnackBar(content: Text("Invalid")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorValues.WHITE_COLOR),
        //appBar: AppBar(title: Text("Sign In")),
      key: scaffoldKey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "AUTHENTICATION",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(ColorValues.THEME_COLOR),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,bottom: 30),
                child: Image(
                  image: AssetImage("assets/images/RegisterIcon.png"),
                  height: 65,
                  width: 65,
                ),
              ),
              Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: emailTextEditingController,
                  style: TextStyle(),
                  decoration: textFieldInputDecoration("User ID"),
                ),
                 SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordTextEditingController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("Password"),
                ),
              ])
              ),
              SizedBox(
                  height: 40,
                ),
              GestureDetector(
                onTap: () {
                   signIn();
                        },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(ColorValues.THEME_COLOR),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 14,
                          fontFamily: "Bold",
                        ),
                      )),
                ),
              ),
            ],
          )            
           ),
          );
  }
}