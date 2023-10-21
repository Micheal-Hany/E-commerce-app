import 'package:flutter/material.dart';
import 'package:store_app/data/data%20source/static/static.dart';

import '../../../core/constant/colors.dart';

class DottesController extends StatelessWidget {
  const DottesController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onboardingList.length,
          (index) => AnimatedContainer(
            duration: const Duration(microseconds: 900),
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
