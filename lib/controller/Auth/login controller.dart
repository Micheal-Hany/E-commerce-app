import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/Auth/login.dart';

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
  StatusRequest stateRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  showPass() {
    showPassword = showPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formDate = formState.currentState;
    if (formDate!.validate()) {
      var formData = formState.currentState;
      if (formData!.validate()) {
        stateRequest = StatusRequest.loading;
        update();
        var response = await loginData.login(email.text, password.text);
        print("response------------------->  $response");
        stateRequest = handleData(response);
        if (StatusRequest.success == stateRequest) {
          if (response["status"] == "success") {
            Get.offNamed(
              AppRouts.signUpSuccess,
            );
          } else {
            Get.defaultDialog(
                title: "Error", middleText: "Email Or Passwordis not correct");
            stateRequest = StatusRequest.failure;
          }
        }
        update();
      }
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
