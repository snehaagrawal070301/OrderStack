import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';

class HomeScreenOptions extends StatelessWidget {
  final String optionTitle;
  final Color? leadingColor;

  const HomeScreenOptions({
    required this.optionTitle,
    required this.leadingColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Mq.height(context) * 0.03),
      padding: EdgeInsets.all(Mq.width(context) * 0.02),
      decoration: BoxDecoration(
        /*boxShadow: [
                                BoxShadow(
                color: grey2.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 0,
              ),],*/
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.4),
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 11,
            width: MediaQuery.of(context).size.width / 11,
            decoration: BoxDecoration(
                color: leadingColor?.withOpacity(0.3),
                borderRadius: BorderRadius.circular(9)),
            child: Center(
              child: Icon(
                Icons.phone,
                color: leadingColor,
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            width: Mq.width(context) / 23.43,
          ),
          myText(optionTitle,
              size: Mq.height(context) * 0.02,
              color: Theme.of(context).textTheme.headline1?.color,
              fontWeight: FontWeight.w400)
        ],
      ),
    );
  }
}