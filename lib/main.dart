import 'package:flutter/material.dart';
import 'package:order_stack/DistributorLogin.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OrderStack",
      home: DistributorLogin(),
    );
  }
}
