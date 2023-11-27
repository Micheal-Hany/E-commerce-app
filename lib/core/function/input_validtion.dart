import 'package:get/get.dart';

inputValidtion(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return '42'.tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "43".tr;
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return '44'.tr;
    }
  }
  if (val.isEmpty) {
    return '45'.tr;
  }
  if (val.length < 5) {
    return '46 $min'.tr;
  }
  if (val.length > 30) {
    return '47 $max'.tr;
  }
}
