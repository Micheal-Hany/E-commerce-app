import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class ProductCategoryAndName extends StatelessWidget {
  const ProductCategoryAndName(
      {super.key, required this.category, required this.productName});
  final String category;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${'60'.tr}: $category', style: CustomStyle.textStyle15),
        const SizedBox(height: 20),
        Container(
            constraints: BoxConstraints(
              maxHeight: Get.height / 15,
              maxWidth: Get.height / 2.6,
            ),
            child: Text(productName,
                style: context.bodyLargeW600!.copyWith(fontSize: 22))),
      ],
    );
  }
}
