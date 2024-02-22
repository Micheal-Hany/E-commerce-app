import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/orderItemsToString.dart';
import 'package:store_app/view/widgets/order_track_page/TimelineTileWidget.dart';
import 'package:get/get.dart';
class OrderListWidget extends StatelessWidget {
  final OrderTrackController controller;

  const OrderListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.orders.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context, index) {
                final order = controller.orders[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${"156".tr} ${index + 1} - (${orderItemsToString(order.items)})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TimelineTileWidget(
                      controller: controller,
                      order: order,
                      isFirst: true,
                    ),
                    TimelineTileWidget(
                      controller: controller,
                      order: order,
                      isShipped: true,
                    ),
                    TimelineTileWidget(
                      controller: controller,
                      order: order,
                      isDelivered: true,
                    ),
                  ],
                );
              },
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: context.height / 3),
            child: Center(
              child: Text(
                '151'.tr,
                style: context.bodyLargeW600,
              ),
            ),
          );
  }
}
