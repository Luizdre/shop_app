import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/splash/splash_page.dart';
import 'package:shop_app/app/modules/splash/splash_store.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
