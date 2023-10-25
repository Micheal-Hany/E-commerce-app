import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  goToSuccess();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;

  @override
  signUp() {
    Get.offNamed(AppRouts.checkEmail);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phone.dispose();

    super.dispose();
  }

  @override
  goToSignIn() {
    Get.back();
  }

  @override
  goToSuccess() {
    Get.offNamed(AppRouts.signUpSuccess);
  }
}
