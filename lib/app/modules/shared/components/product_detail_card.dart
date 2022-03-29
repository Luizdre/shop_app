// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_store.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ProductDetailCard extends StatefulWidget {
  ProductModel product;
  ProductDetailCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState
    extends ModularState<ProductDetailCard, ProductDetailStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Hero(
            tag: widget.product.title!,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Observer(
                    builder: (context) => Image.network(
                      widget.product.image!,
                      height: size.height * 0.35,
                      width: size.width * 0.7,
                      color: store.colorBlend,
                      colorBlendMode: BlendMode.color,
                    ),
                  )),
            )),
        Positioned(
            bottom: size.height * 0.18,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
              disabledColor: sMidGreyOpacity,
            )),
        Positioned(
            bottom: size.height * 0.18,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
              disabledColor: sMidGreyOpacity,
            )),
        Positioned(
            bottom: size.height * 0,
            right: size.width * 0.45,
            child: Container(
              height: 10,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.8)),
            )),
        Positioned(
            bottom: size.height * -0.03,
            right: size.width * 0.05,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/bookmark_icon_.svg',
                  height: size.height * 0.025,
                )))
      ],
    );
  }
}
