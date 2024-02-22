
import 'package:flutter/material.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
class CustomViewAvailableAddressAppbar
    extends GetView<ViewAvailableAddressesController> {
  const CustomViewAvailableAddressAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: context.myTheme.cardColor,
          onPressed: () => controller.goBack(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          "117".tr,
          style: context.bodySmall!.copyWith(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
