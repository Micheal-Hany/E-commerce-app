import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: CustomStyle.textStyle15
          .copyWith(fontWeight: FontWeight.w400, height: 1.4),
    );
  }
}
