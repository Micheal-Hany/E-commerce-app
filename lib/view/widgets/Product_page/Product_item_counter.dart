import 'package:flutter/material.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/Style.dart';

class ProductItemCounter extends StatelessWidget {
  final ProductDetailesControllerImpl controller;

  const ProductItemCounter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text(
                "64".tr,
                style: CustomStyle.textStyle17
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => controller.addOne(),
              icon: const Icon(Icons.plus_one_rounded),
            ),
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF5F6FA),
              ),
              child: Text(
                "${controller.counter.value}",
                style: CustomStyle.textStyle17
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            IconButton(
              onPressed: () => controller.minusOne(),
              icon: const Icon(Icons.exposure_minus_1_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
