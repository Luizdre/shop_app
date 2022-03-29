// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopBottomNavigationBar extends StatefulWidget {
  const ShopBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ShopBottomNavigationBar> createState() =>
      _ShopBottomNavigationBarState();
}

class _ShopBottomNavigationBarState extends State<ShopBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/menu_icon.svg',
                height: size.height * 0.025,
                width: size.width * 0.025,
                color: Colors.black.withOpacity(0.5),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                height: size.height * 0.035,
                width: size.width * 0.035,
                color: Colors.black.withOpacity(0.5),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/bookmark_icon.svg',
                height: size.height * 0.025,
                width: size.width * 0.025,
                color: Colors.black.withOpacity(0.5),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/gear_rounded_icon.svg',
                height: size.height * 0.025,
                width: size.width * 0.025,
                color: Colors.black.withOpacity(0.5),
              )),
        ]);
  }
}
