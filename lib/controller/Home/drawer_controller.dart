import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';

class DrawerControllaller extends GetxController {
  final MyServices myServices = Get.find();
  bool _isDrawerOpen = false;
  bool get isDrawerOpen => _isDrawerOpen;
  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    update();
  }

  Map<Widget, String> data = {
    Image.asset(
      "assets/images/Info Circle.png",
      // width: 25,
      // height: 25,
    ): "Account Information",
    Image.asset(
      "assets/images/Bag (1).png",
      width: 25,
      height: 25,
    ): "Order",
    Image.asset(
      "assets/images/Wallet (1).png",
      width: 25,
      height: 20,
    ): "My Cards",
    Image.asset(
      "assets/images/Heart (1).png",
      width: 25,
      height: 25,
    ): "Wishlist",
    Image.asset(
      "assets/images/Setting.png",
      width: 25,
      height: 25,
    ): "Settings",
  };

  logOut() {
    myServices.sharedPreferences.clear();
    Get.toNamed(AppRouts.login);
  }
}
