// ignore_for_file: file_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ProductDescriptionComponent extends StatefulWidget {
  ProductModel product;
  bool animated;
  ProductDescriptionComponent(
      {Key? key, required this.product, required this.animated})
      : super(key: key);

  @override
  State<ProductDescriptionComponent> createState() =>
      Product_DescriptionComponentState();
}

class Product_DescriptionComponentState
    extends State<ProductDescriptionComponent> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !widget.animated ? 0 : 1,
      duration: const Duration(milliseconds: 900),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Wrap(children: [
          ShopText(
            text: widget.product.description!,
            fontSize: 15,
            overflow: TextOverflow.clip,
          )
        ]),
      ),
    );
  }
}
