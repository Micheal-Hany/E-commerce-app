import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomFavoriteAppBar extends GetView<HaomeScreenContollerImpl> {
  const CustomFavoriteAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.,
      children: [
        CustomCartIcon(
          backgroundColor: context.myTheme.cardColor,
          onPressed: () => controller.changePage(0),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(
          width: 100,
        ),
        Text(
          '65'.tr,
          style: context.bodyLarge,
        ),
        // CustomCartIcon(
        //   backgroundColor: const Color(0xffFEFEFE),
        //   onPressed: () {},
        //   widget: Image.asset('assets/images/bag.PNG'),
        // ),
      ],
    );
  }
}
