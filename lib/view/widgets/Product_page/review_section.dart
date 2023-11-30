import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key,required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Reviews',
              style: CustomStyle.textStyle17
                  .copyWith(fontWeight: FontWeight.w600)),
          TextButton(
            onPressed: onPressed,
            child: const Text('View All', style: CustomStyle.textStyle13),
          )
        ],
      ),
    );
  }
}
