import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_item_style.dart';

class CustomItemStack extends StatelessWidget {
  const CustomItemStack({super.key, required this.controller});
  final HomeControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return CustomItemStyle(
              product: controller.products[index],
            );
          },
        ),
        Positioned(
          top: Dimensions.getHeight(context) * .018,
          left: Dimensions.getHeight(context) * .195,
          child: Image.asset(
            'assets/images/heart.png',
            width: 25,
            height: 25,
          ),
        )
      ],
    );
  }
}
