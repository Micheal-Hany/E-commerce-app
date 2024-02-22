import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<onBordingControllerImplment>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        onPressed: () {
          controller.goToSignInWith();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(controller.isMale.value ? '149'.tr : '150'.tr),
        ),
      ),
    );
  }
}
