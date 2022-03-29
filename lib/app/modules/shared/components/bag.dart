import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class Bag extends ChangeNotifier {
  @observable
  ValueNotifier<List<ProductModel>> products = ValueNotifier([]);

  double get totalPrice {
    double totalPrice = 0;
    for (var product in products.value) {
      totalPrice += product.price!;
    }
    return totalPrice;
  }

  int get qttProducts {
    return products.value.length;
  }

  @action
  int qttProductInBasket(ProductModel product) {
    int qtt = 0;

    qtt = products.value.where((element) => element == product).toList().length;

    return qtt;
  }

  @action
  void removeProductFromBasket(ProductModel product) {
    products.value.remove(product);
    notifyListeners();
  }

  @action
  void addProductToBasket(ProductModel product) {
    products.value.add(product);
    notifyListeners();
  }
}
