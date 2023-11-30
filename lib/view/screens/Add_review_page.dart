import 'package:flutter/material.dart';
import 'package:store_app/controller/add_review_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomCartIcon(
                          backgroundColor: const Color(0xffFEFEFE),
                          onPressed: () => controller.goBackToReviews(),
                          widget: const Icon(Icons.arrow_back_rounded),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.getWidth(context) / 4.5),
                          child: Text(
                            'Add Review',
                            style: CustomStyle.textStyle17
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .06,
                    ),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: CustomStyle.textStyle17
                              .copyWith(color: const Color(0xff1D1E20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
                    Container(
                      width: double.infinity,
                      height: Dimensions.getHeight(context) * .07,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        cursorHeight: 25,
                        cursorColor: Colors.black,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Type your name',
                          hintStyle: CustomStyle.textStyle15,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffFEFEFE)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffFEFEFE)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffFEFEFE)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
                    Row(
                      children: [
                        Text(
                          'How was your experience ?',
                          style: CustomStyle.textStyle17
                              .copyWith(color: const Color(0xff1D1E20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        height: Dimensions.getHeight(context) * .3,
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F6FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorHeight: 25,
                          cursorColor: Colors.black,
                          maxLines:
                              null, // Set maxLines to null to allow unlimited lines
                          expands:
                              true, // Allow the TextFormField to take up multiple lines
                          textAlignVertical:
                              TextAlignVertical.top, // Align text to the top
                          decoration: InputDecoration(
                            hintText: 'Describe your experience?',
                            hintStyle: CustomStyle.textStyle15,
                            prefixText:
                                ' ', // Add a space as a prefix to the hint text
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffFEFEFE)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffFEFEFE)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffFEFEFE)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Star',
                          style: CustomStyle.textStyle17
                              .copyWith(color: const Color(0xff1D1E20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .02,
                    ),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 1, // Initial rating value
                        minRating: 1, // Minimum rating value
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 40.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFF981F),
                        ),
                        onRatingUpdate: (rating) {
                          // Handle rating updates here
                          print(rating);
                        },
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getHeight(context) * .1,
                    ),
                    CustomButton(
                      backgroundColor: const Color(0xff9775FA),
                      buttonName: "Submit Review",
                      height: Dimensions.getHeight(context) * .06,
                      onPressed: () {},
                      width: Dimensions.getWidth(context) * .7,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
