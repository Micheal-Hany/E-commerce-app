import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  @override
  resetPassword() {}
  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRouts.resetPasswordSuccess);
  }
}
