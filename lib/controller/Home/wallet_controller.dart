import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/App%20Theme.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';

class WalletController extends GetxController {
  RxString selectedLanguage = 'en'.obs; // Default language is English
  RxBool isDarkMode = false.obs; // Default mode is light mode
  MyServices myServices = Get.find();
  OrderTrackController orderTrackController = Get.put(OrderTrackController());

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    Get.find<MyServices>().sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
    selectedLanguage.value = langCode;

    updateTheme();
  }

  @override
  void onInit() {
    super.onInit();

    isDarkMode.value =
        myServices.sharedPreferences.getBool('isDarkMode') ?? false;
    updateTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    myServices.sharedPreferences.setBool('isDarkMode', isDarkMode.value);
    updateTheme();
  }

  goToOrdersPage() {
    orderTrackController.getOrders();
    Get.toNamed(AppRouts.orderTrackPage);
  }

  void updateTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(Themes.darkTheme);
    } else {
      Get.changeTheme(Themes.lightTheme);
    }
  }

  getCurrantTheme() {
    isDarkMode.value ? Themes.darkTheme : Themes.lightTheme;
  }
}
