import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';

class StarRatingSection extends StatelessWidget {
  const StarRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Star',
              style: CustomStyle.textStyle17
                  .copyWith(color: const Color(0xff1D1E20)),
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
            onRatingUpdate: (rating) {},
          ),
        ),
      ],
    );
  }
}