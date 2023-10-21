import 'package:flutter/material.dart';
import 'package:store_app/controller/onording_controller.dart';
import 'package:store_app/data/data%20source/static/static.dart';
import 'package:get/get.dart';

class DottesController extends StatelessWidget {
  const DottesController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBordingControllerImplment>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardingList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: controller.currentPage == index ? 20 : 5,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: const Color(0xff8a5365),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
