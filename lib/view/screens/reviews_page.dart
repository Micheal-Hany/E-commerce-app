import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/User_review.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomCartIcon(
                          backgroundColor: const Color(0xffFEFEFE),
                          onPressed: () => controller.goBackToProductPage(),
                          widget: const Icon(Icons.arrow_back_rounded),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getWidth(context) / 4.1),
                          child: Text(
                            'Reviews',
                            style: CustomStyle.textStyle17
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '245',
                                  style: CustomStyle.textStyle15
                                      .copyWith(color: const Color(0xff1D1E20)),
                                ),
                                SizedBox(
                                  width: Dimensions.getWidth(context) * .01,
                                ),
                                Text(
                                  'Reviews',
                                  style: CustomStyle.textStyle15
                                      .copyWith(color: const Color(0xff1D1E20)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star_purple500_sharp,
                                    color: index == 4
                                        ? Colors.black
                                        : const Color(0xffFF981F),
                                    size: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () => controller.goToAddNotePage(),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffFF7043),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit_note_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Add Review",
                                style: CustomStyle.textStyle13
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
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
        ));
  }
}
