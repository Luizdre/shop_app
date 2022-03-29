import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/shared/components/shopButtonComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopProgressIndicatorComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';
import 'package:shop_app/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    store.getShopName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Observer(
          builder: (context) => store.isLoading
              ? const ShopProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ShopText(
                              text:
                                  'Wow, that\'s cool to have you here, tell me which your shop name?',
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                                width: size.width * 0.7,
                                child: TextField(
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: sOrangeButton))),
                                  onChanged: (value) => store.shopName = value,
                                )),
                            IgnorePointer(
                              ignoring: store.shopName.isEmpty,
                              child: ShopButton(
                                  backgroundColor: store.shopName.isEmpty
                                      ? sMidGreyOpacity
                                      : sOrangeButton,
                                  boxShadowColor: store.shopName.isEmpty
                                      ? sMidGreyOpacity
                                      : sOrangeButton,
                                  width: size.width * 0.4,
                                  height: size.height * 0.05,
                                  borderRadius: 17,
                                  content: Center(
                                      child: ShopText(
                                    text: 'Registrar',
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                                  onTap: () => store.registerName()),
                            )
                          ]),
                    ),
                  ),
                )),
    ));
  }
}
