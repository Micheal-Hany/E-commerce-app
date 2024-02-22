import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:get/get.dart';
class GoToRegisterOrLogin extends StatelessWidget {
  const GoToRegisterOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGoToRegisterPageOrLogin(
      textOne: '16'.tr,
      textTwo: '17'.tr,
      onTap: () {
        Get.find<LoginControllerImpl>().goToSignUp();
      },
    );
  }
}