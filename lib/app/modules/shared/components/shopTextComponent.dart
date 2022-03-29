// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class ShopText extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  TextOverflow overflow;
  ShopText(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 15,
      this.color = Colors.black,
      this.overflow = TextOverflow.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
          color: color),
    );
  }
}
