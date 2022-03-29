// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';

class ShopProgressIndicator extends StatelessWidget {
  const ShopProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: sOrangeButton,
        strokeWidth: 2,
      ),
    );
  }
}
