import 'package:flutter/material.dart';
import 'package:store_app/controller/onording_controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/data/data%20source/static/static.dart';
import 'package:get/get.dart';

class CustomSelider extends GetView<onBordingControllerImplment> {
  const CustomSelider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(onboardingList[index].title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 80),
            Image.asset(
              onboardingList[index].imageUrl!,
              width: 200,
              height: 230,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 80),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onboardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      height: 2,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )),
          ],
        );
      },
    );
  }
}
