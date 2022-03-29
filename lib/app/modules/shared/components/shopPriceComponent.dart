// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ShopPriceComponent extends StatelessWidget {
  ProductModel product;
  bool animated;
  ShopPriceComponent({Key? key, required this.product, required this.animated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.03, size.height * 0.03,
          size.width * 0.03, size.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShopText(
            text: 'Price:',
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          ShopText(
            text: '\$ ${product.price.toString()}',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ],
      ),
    );
  }
}
