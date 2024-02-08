import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/data/model/cart_model.dart';
import 'package:store_app/view/widgets/cart/pay_methos-details.dart';
import 'package:get/get.dart';

class CustomPaymentMethod extends StatelessWidget {
  const CustomPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartPageControllerImpl());
    return GetBuilder<CartPageControllerImpl>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("68".tr, style: context.bodySmall!.copyWith(fontSize: 17)),
                IconButton(
                  onPressed: () => controller.goToViewAvalibleCard(),
                  icon: const Icon(Icons.chevron_right_rounded),
                )
              ],
            ),
            CustomUserCardDetailes(
              cardNumber: controller.cardNumber,
            )
          ],
        );
      },
    );
  }
}
