// ignore_for_file: must_be_immutable, file_names

import 'dart:async';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_store.dart';
import 'package:shop_app/app/modules/shared/components/addButtonBasket.dart';
import 'package:shop_app/app/modules/shared/components/color_component.dart';
import 'package:shop_app/app/modules/shared/components/productDescription_component.dart';
import 'package:shop_app/app/modules/shared/components/product_detail_card.dart';
import 'package:shop_app/app/modules/shared/components/shopPriceComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopSizeComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  ProductModel product;
  String? title;
  ProductDetailPage({Key? key, this.title = '', required this.product})
      : super(key: key);
  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState
    extends ModularState<ProductDetailPage, ProductDetailStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Timer(const Duration(milliseconds: 100), () => store.animated = true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerRight,
            child: ShopText(
              text: widget.product.title!,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductDetailCard(product: widget.product),
            Observer(
                builder: (context) => ShopSizeComponent(
                    animated: store.animated, product: widget.product)),
            Observer(
                builder: (context) => ColorComponent(
                    animated: store.animated, product: widget.product)),
            SizedBox(height: size.height * 0.02),
            Observer(
                builder: (context) => ProductDescriptionComponent(
                      product: widget.product,
                      animated: store.animated,
                    )),
            Observer(
                builder: (context) => ShopPriceComponent(
                    product: widget.product, animated: store.animated)),
            Observer(
                builder: (context) => AddButtonBasket(
                    product: widget.product, animated: store.animated))
          ],
        ),
      ),
    );
  }
}
