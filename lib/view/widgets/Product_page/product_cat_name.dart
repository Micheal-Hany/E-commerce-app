import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

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
        Text('Category: $category', style: CustomStyle.textStyle15),
        const SizedBox(height: 10),
        Text(productName, style: CustomStyle.textStyle22),
      ],
    );
  }
}
