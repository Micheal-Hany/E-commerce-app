import 'package:flutter/material.dart';
import 'package:store_app/controller/onording_controller.dart';

import 'package:store_app/data/data%20source/static/static.dart';
import 'package:get/get.dart';

class CustomSelider extends GetView<onBordingControllerImplment> {
  const CustomSelider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              onboardingList[index].imageUrl!,
              width: 200,
              height: 230,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 100),
            Text(onboardingList[index].title!,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 15),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onboardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ],
        );
      },
    );
  }
}
