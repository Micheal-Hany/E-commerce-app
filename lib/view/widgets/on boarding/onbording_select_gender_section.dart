
import 'package:flutter/widgets.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/on%20boarding/onBording_button.dart';
class OnBoardingGenderSelection extends StatelessWidget {
  const OnBoardingGenderSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<onBordingControllerImplment>();
    return Obx(() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnBoardingGenderButton(
                  label: 'Men',
                  onTap: () => controller.selectGender(true),
                  isSelected: controller.isMale.value,
                ),
                OnBoardingGenderButton(
                  label: 'Women',
                  onTap: () => controller.selectGender(false),
                  isSelected: !controller.isMale.value,
                ),
              ],
            ),
          ],
        ));
  }
}
