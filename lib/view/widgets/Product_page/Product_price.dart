import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('61'.tr, style: CustomStyle.textStyle15),
        const SizedBox(height: 20),
        Text('\$$price', style: context.bodyLargeW600),
      ],
    );
  }
}
