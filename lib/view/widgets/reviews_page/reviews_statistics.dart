import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';

class ReviewStatisticsSection extends StatelessWidget {
  final ReviewPageControllerImpl controller;

  const ReviewStatisticsSection(
      {Key? key, required this.controller, required this.count})
      : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  '$count',
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: Dimensions.getWidth(context) * .01,
                ),
                Text(
                  '62'.tr,
                  style: context.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_purple500_sharp,
                    color: index == 4 ? Colors.black : const Color(0xffFF981F),
                    size: 15,
                  ),
                ),
              ],
            )
          ],
        ),
       
      ],
    );
  }
}
