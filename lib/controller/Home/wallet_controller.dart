import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/App%20Theme.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/main.dart';

class WalletController extends GetxController {
  RxString selectedLanguage = 'en'.obs; // Default language is English
  RxBool isDarkMode = false.obs; // Default mode is light mode
  MyServices myServices = Get.find();
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

  // void toggleTheme() {
  //   isDarkMode.value = !isDarkMode.value;
  //   myServices.sharedPreferences.setBool('isDarkMode', isDarkMode.value);
  //   updateTheme();
  // }

  // void updateTheme() {
  //   if (isDarkMode.value) {
  //     Get.changeTheme(Themes.darkTheme);
  //   } else {
  //     Get.changeTheme(Themes.lightTheme);
  //   }
  // }
  @override
  void onInit() {
    super.onInit();
    // Initialize the value of isDarkMode from SharedPreferences
    isDarkMode.value =
        myServices.sharedPreferences.getBool('isDarkMode') ?? false;
    updateTheme(); // Ensure theme is updated based on the initial value
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    myServices.sharedPreferences.setBool('isDarkMode', isDarkMode.value);
    updateTheme();
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
