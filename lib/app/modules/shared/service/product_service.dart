// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:shop_app/app/modules/shared/const/url.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class ProductService {
  final Dio dio;
  final URL_BASE = '$URL_API/products';

  ProductService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      Response<List> response = await dio.get(URL_BASE);

      return response.data!
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on DioError catch (e) {
      // ShopScaffMessenger.instance.showSnack(SnackBar(content: 'Ops, ob'));
    }
    throw '';
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      Response response = await dio.get('$URL_BASE/$id');

      return ProductModel.fromJson(response.data);
    } on DioError catch (e) {
      // ShopScaffMessenger.instance.showSnack(SnackBar(content: 'Ops, ob'));
    }
    throw '';
  }
}
