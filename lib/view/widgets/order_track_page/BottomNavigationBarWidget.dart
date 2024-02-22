import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';

import 'package:store_app/core/constant/colors.dart';

import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/order_track_page/ShowItemSelectionDialog.dart';
import 'package:get/get.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  final OrderTrackController controller;

  const BottomNavigationBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTrackController>(
      builder: (controller) {
        return controller.orders.isNotEmpty
            ? CustomButton(
                buttonName: "63".tr,
                onPressed: () {
                  Get.dialog(ShowItemSelectionDialog(
                    controller: controller,
                    items: controller.items,
                  ));
                },
                backgroundColor: ColorConstant.primary,
                width: double.infinity - 20,
                height: 45,
              )
            : const SizedBox();
      },
    );
  }
}
