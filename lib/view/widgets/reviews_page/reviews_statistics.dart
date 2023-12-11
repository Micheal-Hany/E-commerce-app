import 'package:flutter/material.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';

class ReviewStatisticsSection extends StatelessWidget {
  final ReviewPageControllerImpl controller;

  const ReviewStatisticsSection({Key? key, required this.controller})
      : super(key: key);

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
                    color: index == 4 ? Colors.black : const Color(0xffFF981F),
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
                style: CustomStyle.textStyle13.copyWith(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
