import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  toForgetPassword();
}

class LoginControllerImpl extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool showPassword = true;
  showPass() {
    showPassword = showPassword == true ? false : true;
    update();
  }

  @override
  login() {
    var formDate = formState.currentState;
    if (formDate!.validate()) {
      print('valid fileds');
    } else {
      print('not valid fileds');
    }
  }

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
    Get.offNamed(AppRouts.signup);
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRouts.forgetPass);
  }
}
