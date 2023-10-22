import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/Services.dart';
 

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langCode = myServices.sharedPreferences.getString('lang');
    if (langCode == 'ar') {
      language = const Locale('ar');
    } else if (langCode == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
