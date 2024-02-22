import 'package:flutter/material.dart';
import 'package:store_app/data/model/review_model.dart';
import 'package:store_app/view/widgets/Product_page/Review_content.dart';
import 'package:store_app/view/widgets/Product_page/User_review_info.dart';

class CustomUserReview extends StatelessWidget {
  const CustomUserReview({
    super.key,
    required this.reviewModel,
  });
  final ReviewModel reviewModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          UserInformation(
              name: reviewModel.reviewerName,
              rating: reviewModel.reviewRate,
              time: reviewModel.reviewDate),
          const SizedBox(height: 10),
          ReviewContent(description: reviewModel.reviewNote),
        ],
      ),
    );
  }
}
