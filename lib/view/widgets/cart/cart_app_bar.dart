import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    HaomeScreenContollerImpl controller = Get.find<HaomeScreenContollerImpl>();
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: context.myTheme.cardColor,
          onPressed: () => controller.changePage(0),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        SizedBox(
          width: Dimensions.getWidth(context) / 3.1,
        ),
        Text(
          "66".tr,
          style: context.bodyLarge,
        )
      ],
    );
  }
}
