import 'package:flutter/material.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.name, required this.time});
  final String name;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    final productDetailsController = Get.find<ProductDetailesControllerImpl>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: context.bodySmall!.copyWith(
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              productDetailsController.formatDate(time),
              style: context.bodySmall!.copyWith(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
