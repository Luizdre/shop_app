import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shop_app/app/modules/shared/components/shopDetails.dart';
import 'package:shop_app/app/modules/shared/components/shopHive.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final ShopHive shopHive;
  final ShopDetails shopDetails;

  _SplashStoreBase(this.shopDetails, this.shopHive);

  @observable
  bool isLoading = false;

  @observable
  String shopName = '';

  getShopName() async {
    isLoading = true;

    await shopHive.getShopName().then((value) {
      if (value.isNotEmpty) {
        shopDetails.name = value;
        Modular.to.navigate('/home_page/');
      } else {
        isLoading = false;
      }
    });
  }

  registerName() async {
    await shopHive.putShopName(shopName);
    getShopName();
  }
}
