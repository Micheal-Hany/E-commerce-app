import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/cart/user_location.dart';
import 'package:get/get.dart';

class CustomDeliveryAddress extends StatelessWidget {
  const CustomDeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(CartPageControllerImpl());
    Get.find<CartPageControllerImpl>();
    return GetBuilder<CartPageControllerImpl>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "67".tr,
                  style: context.bodySmall!.copyWith(fontSize: 17),
                ),
                IconButton(
                  onPressed: () => controller.goToAddressPage(),
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
            UserLocationDetails(
              city: controller.city,
              country: controller.country,
            )
          ],
        );
      },
    );
  }
}
