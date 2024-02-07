import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:store_app/view/screens/Map_page.dart';
import 'package:store_app/view/widgets/cart/user_location.dart';
import 'package:get/get.dart';

class CustomDeliveryAddress extends StatelessWidget {
  const CustomDeliveryAddress({super.key});

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
                Text(
                  "67".tr,
                  style: CustomStyle.textStyle17
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () => controller.goToAddressPage(),
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
            CustomUserLocationDetailes(
              city: controller.city,
              country: controller.country,
            )
          ],
        );
      },
    );
  }
}
