import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/app/app_module.dart';
import 'package:shop_app/app/app_widget.dart';
import 'package:shop_app/app/modules/shared/components/shopProgressIndicatorComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/splash/splash_module.dart';
import 'package:shop_app/app/modules/splash/splash_page.dart';

void main() {
  setUpAll(() {});
  testWidgets('Should fill the text field', (WidgetTester tester) async {
    await tester
        .pumpWidget(ModularApp(module: AppModule(), child: const AppWidget()));

    await Modular.isModuleReady<SplashModule>();
    final textField = find.byType(TextField);
    print(textField);
    expect(textField, findsOneWidget);
  });
}
