import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';

import 'package:get/get.dart';
class CusotmOrderAppBar extends StatelessWidget {
  final OrderTrackController controller;

  const CusotmOrderAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          widget: const Icon(Icons.arrow_back_rounded),
          onPressed: () => controller.goBack(),
          backgroundColor: context.theme.cardColor,
        ),
      ],
    );
  }
}
