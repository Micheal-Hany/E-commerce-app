import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/add_review_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Add_review/Name_Experience_section.dart';
import 'package:store_app/view/widgets/Add_review/add_review_header.dart';
import 'package:store_app/view/widgets/Add_review/star_rate_review.dart';

import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class AddReviewpage extends StatelessWidget {
  const AddReviewpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddReviewControllerimple());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AddReviewControllerimple>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
              child: Column(
                children: [
                  AddReviewHeaderSection(controller: controller),
                  SizedBox(height: Dimensions.getHeight(context) * .06),
                  const NameAndExperienceInputSection(),
                  SizedBox(height: Dimensions.getHeight(context) * .02),
                  const StarRatingSection(),
                  SizedBox(height: Dimensions.getHeight(context) * .1),
                  CustomButton(
                    backgroundColor: const Color(0xff9775FA),
                    buttonName: "Submit Review",
                    height: Dimensions.getHeight(context) * .06,
                    onPressed: () {},
                    width: Dimensions.getWidth(context) * .7,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
