// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/modules/home/home_store.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ProductCard extends StatefulWidget {
  ProductModel product;
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ModularState<ProductCard, HomeStore> {
  @override
  initState() {
    store.bag.addListener(() => setState(() {}));
    super.initState();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: sGreyWithOpacity, width: 0.5)),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.02,
            left: size.width * 0.05,
            child: InkWell(
              onTap: () => Modular.to
                  .pushNamed('/product_detail/', arguments: widget.product),
              child: Hero(
                tag: widget.product.title!,
                child: Center(
                  child: Image.network(widget.product.image!,
                      height: size.height * 0.15, width: size.width * 0.35),
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: SvgPicture.asset(
                'assets/icons/bookmark_icon.svg',
                height: size.height * 0.04,
              )),
          Positioned(
              bottom: 10,
              left: size.width * 0.02,
              child: SizedBox(
                width: size.width * 0.38,
                child: ShopText(
                  text: widget.product.title!,
                  fontSize: 12,
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Positioned(
              bottom: 30,
              left: size.width * 0.02,
              child: SizedBox(
                width: size.width * 0.4,
                child: ShopText(
                  text: '\$ ${widget.product.price!.toStringAsFixed(2)}',
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: AnimatedContainer(
                  height: isExpanded ? size.height * 0.15 : size.height * 0.05,
                  width: size.width * 0.08,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10))),
                  child: isExpanded
                      ? Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: -8,
                              child: IconButton(
                                  onPressed: () => store.bag
                                      .removeProductFromBasket(widget.product),
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Colors.white,
                                  )),
                            ),
                            Positioned(
                              top: size.height * 0.07,
                              right: size.width * 0.02,
                              child: InkWell(
                                onTap: () =>
                                    setState(() => isExpanded = !isExpanded),
                                child: ShopText(
                                  text: store.bag
                                      .qttProductInBasket(widget.product)
                                      .toString()
                                      .padLeft(2, '0'),
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -8,
                              child: IconButton(
                                  onPressed: () => store.bag
                                      .addProductToBasket(widget.product),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )
                      : IconButton(
                          onPressed: () =>
                              setState(() => isExpanded = !isExpanded),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 17,
                          )),
                  duration: const Duration(milliseconds: 300)))
        ],
      ),
    );
  }
}
