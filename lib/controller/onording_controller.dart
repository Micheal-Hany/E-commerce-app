import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class onbordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBordingControllerImplment extends onbordingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
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
