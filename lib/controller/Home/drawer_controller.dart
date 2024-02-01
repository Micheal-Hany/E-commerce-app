import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';

class DrawerControllaller extends GetxController {
  HaomeScreenContollerImpl homeScreenCotroller = HaomeScreenContollerImpl();
  var name = "";

  @override
  void onInit() {
    // Retrieve value from SharedPreferences
    var usernameFromSharedPreferences =
        myServices.sharedPreferences.get("username");

    // Check if the value is not null and then assign it to 'name', otherwise, use a default value (empty string in this case).
    name = usernameFromSharedPreferences != null
        ? usernameFromSharedPreferences.toString()
        : "";

    super.onInit();
  }

  final MyServices myServices = Get.find();
  bool _isDrawerOpen = false;
  bool get isDrawerOpen => _isDrawerOpen;
  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    update();
  }

//  myServices.sharedPreferences
//               .setString("username", response["data"]["users_name"]);

  Map<Widget, String> data = {
    Image.asset(
      "assets/images/Info Circle.png",
      // width: 25,
      // height: 25,
    ): "102".tr,
    Image.asset(
      "assets/images/Bag (1).png",
      width: 25,
      height: 25,
    ): "103".tr,
    Image.asset(
      "assets/images/Wallet (1).png",
      width: 25,
      height: 20,
    ): "104".tr,
    Image.asset(
      "assets/images/Heart (1).png",
      width: 25,
      height: 25,
    ): "105".tr,
    Image.asset(
      "assets/images/Setting.png",
      width: 25,
      height: 25,
    ): "106".tr,
  };

  logOut() {
    myServices.sharedPreferences.clear();
    Get.toNamed(AppRouts.login);
  }
}
