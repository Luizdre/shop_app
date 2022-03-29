// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_store.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ColorComponent extends StatefulWidget {
  bool animated;
  ProductModel product;
  ColorComponent({Key? key, required this.animated, required this.product})
      : super(key: key);

  @override
  State<ColorComponent> createState() => _ColorComponentState();
}

class _ColorComponentState
    extends ModularState<ColorComponent, ProductDetailStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: !widget.animated ? 0 : 1,
      duration: const Duration(milliseconds: 600),
      child: AnimatedPadding(
        padding: EdgeInsets.only(bottom: !widget.animated ? 20 : 0),
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
            child: widget.product.category!.contains('cloth')
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShopText(
                          text: 'Color: ',
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              [Colors.transparent, sPink, sYellow, sBlueGreen]
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            right: size.width * 0.05),
                                        child: InkWell(
                                          onTap: () => store.colorBlend = e,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: e == Colors.transparent
                                                    ? Colors.black
                                                    : e,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                        )
                      ],
                    ),
                  )
                : const SizedBox()),
      ),
    );
  }
}
