// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';

class ShopSnackBar extends SnackBar {
  Function()? callBack;
  String message;
  bool retry;
  ShopSnackBar(
      {Key? key,
      required this.message,
      required this.callBack,
      this.retry = true})
      : super(key: key, content: ShopText(text: message, color: Colors.white));

  Widget build(BuildContext context) {
    return Container();
  }
}
