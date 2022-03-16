import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
          title: Text("MyChattingApp"),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 17);
}

class Mq {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

myText(String content,
    {
    double size = 20,
    Color? color = Colors.white,
    TextAlign alignment = TextAlign.start,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    content,
    textAlign: alignment,
    overflow: TextOverflow.fade,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

inputStyle(BuildContext context) {
  return TextStyle(
    fontSize: 17,
    letterSpacing: 1.5,
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.headline1!.color,
  );
}
