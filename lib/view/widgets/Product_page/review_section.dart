import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('62'.tr,
              style: CustomStyle.textStyle17
                  .copyWith(fontWeight: FontWeight.w600)),
          TextButton(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            onPressed: onPressed,
            child: Text('57'.tr, style: CustomStyle.textStyle13),
          )
        ],
      ),
    );
  }
}
