import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/data/data%20source/remote/Auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  goToSuccess();
}

class SignUpControllerImpl extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;
  bool showPassword = true;
  MyServices myServices = Get.find();
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  StatusRequest stateRequest = StatusRequest.none;
  showPass() {
    showPassword = showPassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      stateRequest = StatusRequest.loading;
      update();
      var response = await signUpData.signUp(
          userName.text, email.text, password.text, phone.text);
      print("response------------------->  $response");
      stateRequest = handleData(response);
      if (StatusRequest.success == stateRequest) {
        if (response["status"] == "success") {
          data.add(response["data"]);
          Get.offNamed(AppRouts.signUpVerifayCode,
              arguments: {"email": email.text});
          myServices.sharedPreferences
              .setString("username", response["data"]["users_name"]);
          email.clear();
          password.clear();
          phone.clear();
          userName.clear();
        } else {
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
