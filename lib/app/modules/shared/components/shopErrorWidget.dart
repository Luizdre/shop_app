// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';

class ShopError extends StatelessWidget {
  VoidCallback retry;
  ShopError({Key? key, required this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShopText(
            text: 'Ops, seems we had a problem, click on icon to try again'),
        SizedBox(
          height: 50,
          width: 50,
          child: IconButton(
              onPressed: retry,
              icon: const Icon(
                Icons.autorenew_rounded,
                size: 30,
              )),
        )
      ],
    );
  }
}
