import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/on%20boarding/buttom_container.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/intro.png'),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: OnBoardingBottomContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

