import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('onbording') == '1') {
      return const RouteSettings(name: AppRouts.login);
    }
    return null;
  }
}
