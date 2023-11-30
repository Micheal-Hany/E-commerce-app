import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price', style: CustomStyle.textStyle15),
        const SizedBox(height: 10),
        Text('\$$price', style: CustomStyle.textStyle22),
      ],
    );
  }
}
