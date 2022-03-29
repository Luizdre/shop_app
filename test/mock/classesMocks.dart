// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:shop_app/app/modules/shared/service/product_service.dart';

class DioMock extends Mock implements Dio {}

class ProductServiceMock extends Mock implements ProductService {}
