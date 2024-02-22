import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/controller/add_review_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';

class StarRatingSection extends StatelessWidget {
  const StarRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '101'.tr,
              style: context.bodySmall!.copyWith(
                fontSize: 17,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.getHeight(context) * .02),
        Center(
          child: RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 40.0,
            itemBuilder: (context, _) => const Icon(
              Icons.star_rate_rounded,
              color: Color(0xffFF981F),
            ),
            onRatingUpdate: (rating) {
              Get.find<AddReviewControllerimple>().rate = rating;
            },
          ),
        ),
      ],
    );
  }
}
