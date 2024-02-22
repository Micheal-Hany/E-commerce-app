import 'package:flutter/widgets.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/on%20boarding/onbording_header.dart';
import 'package:store_app/view/widgets/on%20boarding/onbording_nextButton.dart';
import 'package:store_app/view/widgets/on%20boarding/onbording_select_gender_section.dart';

class OnBoardingBottomContainer extends StatelessWidget {
  const OnBoardingBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
 Get.find<onBordingControllerImplment>();
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnBoardingHeader(),
          SizedBox(height: 20),
          OnBoardingGenderSelection(),
          SizedBox(height: 10),
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
