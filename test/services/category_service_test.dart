import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';
import 'package:shop_app/app/modules/shared/service/categories_service.dart';

void main() {
  Dio _dioMock = Dio();

  CategoriesService _categorieService = CategoriesService(_dioMock);

  late List<String> _categories;

  late List<ProductModel> _electronicProducts;

  setUp(() async {
    print('Initializing CategoryService Test Variables');
    _categories = await _categorieService.getCategories();
    _electronicProducts =
        await _categorieService.getProductsByCategory('electronics');
  });

  tearDown(() {
    print('Disposing CategoryService Test');
  });

  group('Will test CategorieServices methods', () {
    test('Should not be null, will verify the first and end items', () {
      expect(_categories.isNotEmpty, equals(true));
      expect(_categories.first, equals('electronics'));
      expect(_categories.last, equals('women\'s clothing'));
    });

    test(
        'Should not be null, will verify the type of list, the first and last items',
        () {
      expect(_electronicProducts.isNotEmpty, equals(true));
      expect(_electronicProducts, isA<List<ProductModel>>());
      expect(_electronicProducts.first.title,
          equals('WD 2TB Elements Portable External Hard Drive - USB 3.0 '));
      expect(
          _electronicProducts.last.title,
          equals(
              'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED '));
    });
  });
}
