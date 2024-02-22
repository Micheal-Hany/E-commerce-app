
import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:get/get.dart';
class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.find<LoginControllerImpl>().toForgetPassword();
          },
          child: Text(
            '14'.tr,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
