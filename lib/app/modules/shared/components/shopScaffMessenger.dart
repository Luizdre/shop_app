// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShopScaffMessenger {
  static final ShopScaffMessenger instance = ShopScaffMessenger();

  final GlobalKey<ScaffoldMessengerState> scaffKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack({required SnackBar snackbar}) {
    scaffKey.currentState?.showSnackBar(snackbar);
  }
}
