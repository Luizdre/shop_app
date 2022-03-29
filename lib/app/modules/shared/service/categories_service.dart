// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:shop_app/app/modules/shared/const/url.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';

class CategoriesService {
  final Dio dio;
  final URL_BASE = '$URL_API/products';

  CategoriesService(this.dio);

  Future<List<String>> getCategories() async {
    Response<List> response = await dio.get('$URL_BASE/categories');

    return response.data!.map((category) => category.toString()).toList();
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      Response<List> response = await dio.get('$URL_BASE/category/$category');

      return response.data!
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on DioError catch (e) {
      // ShopScaffMessenger.instance.showSnack(snackbar);
    }
    throw '';
  }
}
