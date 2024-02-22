
import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:get/get.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonName: '15'.tr,
      onPressed: () {
        Get.find<LoginControllerImpl>().login();
      },
      backgroundColor: ColorConstant.primary,
      width: double.infinity - 20,
      height: 40,
    );
  }
}