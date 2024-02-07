import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/App%20Theme.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/main.dart';

class WalletController extends GetxController {
  RxString selectedLanguage = 'en'.obs; // Default language is English
  RxBool isDarkMode = false.obs; // Default mode is light mode
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);

    Get.find<MyServices>().sharedPreferences.setString("lang", langCode);

    Get.updateLocale(locale);
    selectedLanguage.value = langCode;

    if (locale.languageCode == 'ar') {
      Get.changeTheme(themeArabic);
    } else {
      Get.changeTheme(themeEnglish);
    }
  }

  void toggleTheme() {
    // Toggle the theme mode
    isDarkMode.value = !isDarkMode.value;
    // Save the theme preference
    Get.find<MyServices>()
        .sharedPreferences
        .setBool('isDarkMode', isDarkMode.value);
    // Update theme
    updateTheme();
  }

  void updateTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(Themes.darkTheme);
    } else {
      Get.changeTheme(Themes.lightTheme);
    }
  }
}
