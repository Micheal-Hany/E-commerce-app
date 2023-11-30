
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
      style: CustomStyle.textStyle15
          .copyWith(fontWeight: FontWeight.w400, height: 1.4),
    );
  }
}