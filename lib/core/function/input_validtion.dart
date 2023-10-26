import 'package:get/get.dart';

inputValidtion(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'Please enter valid Username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Please enter valid Email';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Please enter valid Phone Number';
    }
  }
  if (val.isEmpty) {
    return 'This field is required';
  }
  if (val.length < 5) {
    return 'must be greater than $min';
  }
  if (val.length > 30) {
    return 'must be less than $max';
  }
}
