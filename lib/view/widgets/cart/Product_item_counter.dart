import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductItemCounter extends StatelessWidget {
  final CartPageControllerImpl controller;
  final ProductModel product;

  const ProductItemCounter({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.minusOne();
            controller.getOrderdProducts();
            // controller.updatePrices();
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffDEDEDE),
                width: 1.0,
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xff8F959E),
            ),
          ),
        ),
        SizedBox(width: Dimensions.getWidth(context) * .05),
        Obx(
          () => Text("${controller.counter.value}",
              style: context.bodySmall!.copyWith(fontSize: 15)),
        ),
        SizedBox(width: Dimensions.getWidth(context) * .05),
        GestureDetector(
          onTap: () {
            controller.addOne();
            controller.getOrderdProducts();
            // controller.updatePrices();
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffDEDEDE),
                width: 1.0,
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              color: Color(0xff8F959E),
            ),
          ),
        ),
        SizedBox(width: Dimensions.getWidth(context) * .2),
        GestureDetector(
          onTap: () {
            controller.remove(product);
            controller.getOrderdProducts();
            // controller.updatePrices();
          },
          child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffDEDEDE),
                  width: 1.0,
                ),
              ),
              child: Image.asset(
                'assets/images/baskect.png',
              )),
        )
      ],
    );
  }
}
