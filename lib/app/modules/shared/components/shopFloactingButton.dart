// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/modules/home/home_store.dart';
import 'package:shop_app/app/modules/shared/components/bag_component.dart';
import 'package:shop_app/app/modules/shared/components/shopButtonComponent.dart';

class ShopFloatingbutton extends StatefulWidget {
  const ShopFloatingbutton({Key? key}) : super(key: key);

  @override
  State<ShopFloatingbutton> createState() => _ShopFloatingbuttonState();
}

class _ShopFloatingbuttonState
    extends ModularState<ShopFloatingbutton, HomeStore> {
  @override
  void initState() {
    store.bag.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ShopButton(
      height: 50,
      width: 50,
      backgroundColor: Colors.white,
      borderRadius: 17,
      onTap: () {},
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(top: -10, right: 17, child: BagComponent()),
          Center(
              child: SvgPicture.asset(
            'assets/icons/bag_icon.svg',
            height: size.height * 0.035,
          ))
        ],
      ),
      boxShadowColor: Colors.grey.withOpacity(0.5),
    );
  }
}
