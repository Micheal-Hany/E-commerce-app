import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/data/model/order_model.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:get/get.dart';
class TimelineTileWidget extends StatelessWidget {
  final OrderTrackController controller;
  final OrderModel order;
  final bool isFirst;
  final bool isShipped;
  final bool isDelivered;

  const TimelineTileWidget({
    super.key,
    required this.controller,
    required this.order,
    this.isFirst = false,
    this.isShipped = false,
    this.isDelivered = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.15,
      isFirst: isFirst,
      isLast: isDelivered,
      indicatorStyle: IndicatorStyle(
        color: ColorConstant.primary,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.grey.withOpacity(0.5),
      ),
      endChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isShipped
                ? '157'.tr
                : isDelivered
                    ? '158'.tr
                    : '159'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isShipped
                ? controller.formatDateTime(order.orderDateTime)
                : isDelivered
                    ? controller.formatDateTime(order.orderDateTime)
                    : controller.formatDateTime(order.orderDateTime),
          ),
        ],
      ),
    );
  }
}
