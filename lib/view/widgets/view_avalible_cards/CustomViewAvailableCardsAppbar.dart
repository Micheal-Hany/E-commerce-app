
import 'package:flutter/material.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
class CustomViewAvailableCardsAppbar
    extends GetView<ViewAvailableCardsController> {
  const CustomViewAvailableCardsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: context.theme.cardColor,
          onPressed: () => controller.goBack(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(width: 75),
        Text(
          "122".tr,
          style: context.bodySmall!.copyWith(fontSize: 17),
        ),
      ],
    );
  }
}
