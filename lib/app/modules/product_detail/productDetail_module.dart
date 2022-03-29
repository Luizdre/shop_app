// ignore_for_file: file_names

import 'package:shop_app/app/modules/product_detail/productDetail_page.dart';
import 'package:shop_app/app/modules/product_detail/productDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductDetailStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => ProductDetailPage(
              product: args.data,
            )),
  ];
}
