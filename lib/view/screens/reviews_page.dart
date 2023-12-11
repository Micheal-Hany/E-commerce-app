import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/User_review.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_page_app_bar.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_statistics.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewPageControllerImpl());
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      body: GetBuilder<ReviewPageControllerImpl>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
              child: Column(
                children: [
                  ReviewsPageCustomAppBar(controller: controller),
                  SizedBox(height: Dimensions.getHeight(context) * .03),
                  ReviewStatisticsSection(controller: controller),
                  SizedBox(height: Dimensions.getHeight(context) * .02),
                  ...List.generate(5, (index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: Dimensions.getHeight(context) * .01,
                        ),
                        const CustomUserReview(),
                      ],
                    );
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
