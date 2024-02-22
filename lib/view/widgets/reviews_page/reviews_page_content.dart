
import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_list.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_page_app_bar.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_statistics.dart';
import 'package:get/get.dart';
class ReviewPageContent extends StatelessWidget {
  const ReviewPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewPageControllerImpl>(
      builder: (controller) {
        controller.reviews = Get.arguments;
        controller.itemId = Get.parameters['id']!;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
            child: Column(
              children: [
                ReviewsPageCustomAppBar(controller: controller),
                SizedBox(height: Dimensions.getHeight(context) * .03),
                ReviewStatisticsSection(
                  controller: controller,
                  count: controller.reviews.length,
                ),
                SizedBox(height: Dimensions.getHeight(context) * .02),
                ReviewList(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
