import 'package:store_app/core/services/Services.dart';
import 'package:get/get.dart';

translateDataBase(colunmar, colunmen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return colunmar;
  } else {
    return colunmen;
  }
}
