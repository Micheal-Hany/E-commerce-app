import 'package:flutter/widgets.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Column(
        children: [
          Text(
            '145'.tr,
            style: context.headlineMedium,
          ),
          const SizedBox(height: 10.0),
          Text(
            '146'.tr,
            style: context.bodyMedium?.copyWith(color: ColorConstant.manatee),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
