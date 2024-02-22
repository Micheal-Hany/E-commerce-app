import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartPageControllerImpl>();
    // print(controller.shipingCost);
    return Obx(() => Column(
          children: [
            Row(
              children: [
                Text(
                  "69".tr,
                  style: context.bodySmall!.copyWith(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "70".tr,
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "\$${controller.subTotalPrice}",
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "71".tr,
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "\$${controller.shipingCost}",
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "72".tr,
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "\$${controller.totalCost}",
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
