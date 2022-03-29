import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_module.dart';
import 'package:shop_app/app/modules/shared/components/bag.dart';
import 'package:shop_app/app/modules/shared/components/shopDetails.dart';
import 'package:shop_app/app/modules/shared/components/shopHive.dart';
import 'package:shop_app/app/modules/shared/service/categories_service.dart';
import 'package:shop_app/app/modules/shared/service/product_service.dart';
import 'package:shop_app/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProductService(i.get())),
    Bind((i) => CategoriesService(i.get())),
    Bind((i) => Bag()),
    Bind((i) => ShopHive()),
    Bind((i) => ShopDetails()),
    Bind((i) => Dio())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home_page', module: HomeModule()),
    ModuleRoute('/product_detail', module: ProductDetailModule())
  ];
}
