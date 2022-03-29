// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';

class ShopFilterComponent extends StatefulWidget {
  dynamic store;
  ShopFilterComponent({Key? key, required this.store}) : super(key: key);

  @override
  State<ShopFilterComponent> createState() => _ShopFilterComponentState();
}

class _ShopFilterComponentState extends State<ShopFilterComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: sGreyWithOpacity, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShopText(text: 'Filtrar por valor'),
          Observer(
              builder: (context) => ShopText(
                  text: '\$ ${widget.store.valueToFilter.toStringAsFixed(2)}')),
          Observer(
              builder: (context) => Slider(
                  value: widget.store.valueToFilter,
                  max: widget.store.maxPrice,
                  activeColor: sOrangeButton,
                  onChanged: (value) => widget.store.filterByPrice(value))),
        ],
      ),
    );
  }
}
