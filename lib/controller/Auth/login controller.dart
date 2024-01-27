import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
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
  MyServices myServices = Get.find();
  showPass() {
    showPassword = showPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      stateRequest = StatusRequest.loading;
      update();
      var response = await loginData.login(email.text, password.text);
      print("response------------------->  $response");
      stateRequest = handleData(response);
      if (StatusRequest.success == stateRequest) {
        if (response["status"] == "success") {
          /// if (response["data"]["users_approve"] == "1") {
          myServices.sharedPreferences
              .setString("id", "${response["data"]["users_id"]}");
          myServices.sharedPreferences
              .setString("email", response["data"]["users_email"]);
          myServices.sharedPreferences
              .setString("phone", response["data"]["users_phone"]);
          myServices.sharedPreferences
              .setString("username", response["data"]["users_name"]);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(
            AppRouts.homePage,
          );
          //} else {
          // Get.toNamed(AppRouts.signUpVerifayCode,
          //     arguments: {"email": email.text});
          //Get.toNamed(AppRouts.signUpVerifayCode,
          //   arguments: {"email": email.text});
          //}
        } else {
          Get.defaultDialog(
              title: "Error", middleText: "Email Or Passwordis not correct");
          stateRequest = StatusRequest.failure;
        }
      }
      update();
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
