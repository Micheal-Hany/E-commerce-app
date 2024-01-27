import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartPageControllerImpl());
    return GetBuilder<CartPageControllerImpl>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  "Order Info",
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
                  "Subtotal",
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.calcSubTotalPrice(controller.counter.value)}",
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
                  "Shipping cost",
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.calcShippingCost(controller.counter.value)}",
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
                  "Total",
                  style: CustomStyle.textStyle15
                      .copyWith(color: const Color(0xff8F959E)),
                ),
                Text(
                  "\$${controller.calcTotalCost()}",
                  style: CustomStyle.textStyle15.copyWith(color: Colors.black),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
