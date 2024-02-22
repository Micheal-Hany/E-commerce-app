import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Product_page/User_review.dart';

class ReviewList extends StatelessWidget {
  final ReviewPageControllerImpl controller;

  const ReviewList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.reviews.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.reviews.length,
            itemBuilder: (context, index) {
              return CustomUserReview(
                reviewModel: controller.reviews[index],
              );
            },
          )
        : Text(
            'there is no reviews about this product',
            style: context.bodyLarge,
          );
  }
}
