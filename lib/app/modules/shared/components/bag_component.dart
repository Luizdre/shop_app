import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shop_app/app/modules/home/home_store.dart';
import 'package:shop_app/app/modules/shared/components/shopButtonComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';

class BagComponent extends StatefulWidget {
  const BagComponent({Key? key}) : super(key: key);

  @override
  State<BagComponent> createState() => _BagComponentState();
}

class _BagComponentState extends ModularState<BagComponent, HomeStore> {
  @override
  void initState() {
    store.bag.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: ShopButton(
          borderRadius: 5,
          backgroundColor: sOrangeButton,
          boxShadowColor: sOrangeButton,
          onTap: () {},
          content: Center(
            child: ShopText(
                color: Colors.white,
                fontSize: 10,
                text: store.bag.qttProducts.toString().padLeft(2, '0')),
          )),
    );
  }
}
