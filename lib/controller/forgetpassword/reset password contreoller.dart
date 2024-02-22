import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword(String password);
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  TextEditingController password = TextEditingController();

  StatusRequest stateRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  resetPassword() {}

  @override
  void dispose() {
    password.dispose();
    // rePassword.dispose();
    super.dispose();
  }

  @override
  goToSuccessResetPassword(String password) async {
    stateRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.resetPassword(email!, password);
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRouts.resetPasswordSuccess);
        email = '';
        update();
      } else {
        Get.defaultDialog(
            title: "48".tr,
            middleText: "52".tr,
            titleStyle: TextStyle(color: ColorConstant.primary),
            middleTextStyle: TextStyle(color: ColorConstant.primary));
        stateRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }
}
