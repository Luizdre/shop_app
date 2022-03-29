// ignore_for_file: file_names
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ShopHive {
  Future<String> getShopName() async {
    await Hive.openBox('shop_name');
    return await Hive.box('shop_name').get('name') ?? '';
  }

  Future putShopName(String name) async {
    await Hive.openBox('shop_name');
    await Hive.box('shop_name').put('name', name);
  }

  Future delete() async {
    await Hive.openBox('shop_name');
    await Hive.box('shop_name').delete('name');
  }

  Future createHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
