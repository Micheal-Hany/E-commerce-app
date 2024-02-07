import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartPageControllerImpl());
    return Obx(() => Column(
          children: [
            Row(
              children: [
                Text(
                  "69".tr,
                  style: CustomStyle.textStyle17
                      .copyWith(fontWeight: FontWeight.w500),
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
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.subTotalPrice}",
                  style: CustomStyle.textStyle15.copyWith(color: Colors.black),
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
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.shipingCost}",
                  style: CustomStyle.textStyle15.copyWith(color: Colors.black),
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
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.totalCost}",
                  style: CustomStyle.textStyle15.copyWith(color: Colors.black),
                )
              ],
            ),
          ],
        ));
  }
}
