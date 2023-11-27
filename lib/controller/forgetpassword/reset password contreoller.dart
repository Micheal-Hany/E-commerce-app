import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  StatusRequest stateRequest = StatusRequest.none;
  ResetPassword resetPasswordData = ResetPassword(Get.find());
  String? email;
  @override
  resetPassword() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
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
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(title: "48".tr, middleText: "51".tr);
    }

    if (formState.currentState!.validate()) {
      stateRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordData.resetPassword(email!, password.text);
      print("=============================== Controller $response ");
      stateRequest = handleData(response);
      if (StatusRequest.success == stateRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.resetPasswordSuccess);
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "52".tr);
          stateRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }
}
