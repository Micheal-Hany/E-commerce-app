
import 'package:flutter/material.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/Product_page/User_review.dart';
import 'package:store_app/view/widgets/Product_page/review_section.dart';

class ReviewsSectionProductPage extends StatelessWidget {
  final ProductDetailesControllerImpl controller;

  const ReviewsSectionProductPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewsSection(onPressed: () => controller.goToReviewPage()),
        controller.reviews.isNotEmpty
            ? CustomUserReview(
                reviewModel: controller.reviews.first,
              )
            : Text(
                'there is no reviews about this product',
                style: context.bodyLarge,
              ),
        const SizedBox(height: 40),
      ],
    );
  }
}
