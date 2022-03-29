// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/shared/components/shopScaffMessenger.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScaffoldMessenger(
            key: ShopScaffMessenger.instance.scaffKey, child: child!);
      },
      theme: ThemeData(primarySwatch: Colors.orange),
    ).modular();
  }
}
