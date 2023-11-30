import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '4.8',
              style: CustomStyle.textStyle15
                  .copyWith(color: AppColor.primaryColorDart),
            ),
            const SizedBox(width: 5),
            const Text(
              'rating',
              style: CustomStyle.textStyle11,
            ),
          ],
        ),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star_purple500_sharp,
              color: index == 4 ? Colors.black : const Color(0xffFF981F),
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
