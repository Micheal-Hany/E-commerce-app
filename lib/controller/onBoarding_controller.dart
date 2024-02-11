import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';

abstract class onbordingController extends GetxController {}

class onBordingControllerImplment extends onbordingController {
  var isMale = false.obs;

  void selectGender(bool male) {
    isMale.value = male;
  }

  goToSignInWith() {
    Get.toNamed(AppRouts.signInWithPage);
  }
}
