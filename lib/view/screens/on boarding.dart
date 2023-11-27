import 'package:flutter/material.dart';
import 'package:store_app/controller/onording_controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/on%20boarding/custom%20selider.dart';

import '../widgets/on boarding/Custom button.dart';
import '../widgets/on boarding/dottes controller.dart';
import 'package:get/get.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBordingControllerImplment());
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 3,
              child: CustomSelider(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DottesController(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
