// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ShopSizeComponent extends StatelessWidget {
  ProductModel product;
  bool animated;
  ShopSizeComponent({Key? key, required this.product, required this.animated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Container(
        height: size.height * 0.12,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: sGreyWithOpacity, width: 1),
                bottom: BorderSide(color: sGreyWithOpacity, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShopText(
                text: 'Size(US):',
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [4, 5, 6]
                  .map((productSize) => Container(
                      width: size.width * 0.16,
                      height: size.height,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: sGreyWithOpacity, width: 1))),
                      child: Center(
                          child: ShopText(
                        text: productSize.toString(),
                        fontWeight: FontWeight.w500,
                      ))))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
