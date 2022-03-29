import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';
import 'package:shop_app/app/modules/shared/service/product_service.dart';

void main() {
  Dio _dioMock = Dio();
  ProductService _productServiceMock = ProductService(_dioMock);
  late List<ProductModel> products;
  late ProductModel uniqueProduct;

  setUp(() async {
    print('Initializing ProductServices Test variables');
    products = await _productServiceMock.getProducts();
    uniqueProduct = await _productServiceMock.getProductById(3);
  });

  tearDown(() {
    print('Disposing ProductServices test');
  });

  group('Will test ProductServices methods', () {
    test(
        'Should not be empty, the type of list, will verify the first and last item',
        () async {
      expect(products.isNotEmpty, equals(true));
      expect(products, isA<List<ProductModel>>());
      expect(products.first.title,
          equals('Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops'));
      expect(products.last.title,
          equals('DANVOUY Womens T Shirt Casual Cotton Short'));
    });

    test('Should be a instance of Product Model, will verify title and price',
        () {
      expect(uniqueProduct.title, equals('Mens Cotton Jacket'));
      expect(uniqueProduct.price, equals(55.99));
      expect(uniqueProduct, isA<ProductModel>());
    });
  });
}
