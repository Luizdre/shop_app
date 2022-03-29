// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_store.dart';
import 'package:shop_app/app/modules/shared/components/shopButtonComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class AddButtonBasket extends StatefulWidget {
  ProductModel product;
  bool animated;
  AddButtonBasket({Key? key, required this.product, required this.animated})
      : super(key: key);

  @override
  State<AddButtonBasket> createState() => _AddButtonBasketState();
}

class _AddButtonBasketState
    extends ModularState<AddButtonBasket, ProductDetailStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: !widget.animated ? 0 : 1,
      child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.01),
          child: ShopButton(
              height: size.height * 0.08,
              width: size.width * 0.9,
              borderRadius: 20,
              boxShadowColor: sOrangeButton,
              backgroundColor: sOrangeButton,
              content: Center(
                  child: ShopText(
                text: 'Add to basket',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
              onTap: () => store.addProductToBag(widget.product))),
    );
  }
}
