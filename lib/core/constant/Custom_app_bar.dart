import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          widget: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.back(),
          backgroundColor: context.myTheme.cardColor,
        ),
      ],
    );
  }
}
