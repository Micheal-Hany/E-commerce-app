import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/App%20Theme.dart';
import 'package:store_app/core/services/Services.dart';

class LocalController extends GetxController {
  Locale? language;
  ThemeData appTheme = themeEnglish;

  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
    locale.languageCode == 'ar'
        ? appTheme = themeArabic
        : appTheme = themeEnglish;
    Get.changeTheme(appTheme);
  }

  @override
  void onInit() {
    String? langCode = myServices.sharedPreferences.getString('lang');
    if (langCode == 'ar') {
      appTheme = themeArabic;
      language = const Locale('ar');
    } else if (langCode == 'en') {
      appTheme = themeEnglish;

      language = const Locale('en');
    } else {
      appTheme = themeEnglish;

      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
