// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_app/app/modules/shared/components/bag.dart';
import 'package:shop_app/app/modules/shared/components/shopScaffMessenger.dart';
import 'package:shop_app/app/modules/shared/components/shopSnackBarComponent.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

part 'productDetail_store.g.dart';

class ProductDetailStore = _ProductDetailStoreBase with _$ProductDetailStore;

abstract class _ProductDetailStoreBase with Store {
  final Bag bag;

  _ProductDetailStoreBase(this.bag);

  @observable
  Color colorBlend = Colors.transparent;

  @observable
  bool animated = false;

  void addProductToBag(ProductModel product) {
    bag.addProductToBasket(product);
    Modular.to.pop();
    ShopScaffMessenger.instance.showSnack(
        snackbar: ShopSnackBar(
            message: 'Produto adicionado a sacola ${product.title}',
            retry: false,
            callBack: () {}));
  }
}
