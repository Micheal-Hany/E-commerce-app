import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class ReviewsPageCustomAppBar extends StatelessWidget {
  final ReviewPageControllerImpl controller;

  const ReviewsPageCustomAppBar({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor:context.myTheme.cardColor,
          onPressed: () => controller.goBackToProductPage(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context) / 4.1),
          child: Text(
            '62'.tr,
            style: context.bodySmall!.copyWith(
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}
