import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/data/data%20source/static/static.dart';

abstract class onbordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBordingControllerImplment extends onbordingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRouts.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
