import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  toForgetPassword();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {}
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRouts.signup);
  }
  
  @override
  toForgetPassword() {
     Get.toNamed(AppRouts.forgetPass);
  }
}
