// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class ShopButton extends StatelessWidget {
  Function()? onTap;
  Widget content;
  double height;
  double width;
  double borderRadius;
  Color boxShadowColor;
  Color backgroundColor;
  ShopButton(
      {Key? key,
      required this.onTap,
      required this.content,
      this.width = 15,
      this.height = 15,
      this.borderRadius = 10,
      this.boxShadowColor = Colors.transparent,
      this.backgroundColor = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: boxShadowColor,
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ]),
        child: content,
      ),
    );
  }
}
