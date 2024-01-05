import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';

class ProductItemCounter extends StatelessWidget {
  final CartPageControllerImpl controller;

  const ProductItemCounter({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.minusOne(),
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
        Text(
          "${controller.counter.value}",
          style: CustomStyle.textStyle15
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(width: Dimensions.getWidth(context) * .05),
        GestureDetector(
          onTap: () => controller.addOne(),
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
          onTap: () {},
          child: Container(
            width: 45, // Increase the width
            height: 45, // Increase the height
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffDEDEDE),
                width: 1.0,
              ),
            ),
            child: CustomCartIcon(
              backgroundColor: const Color(0xffFEFEFE),
              onPressed: () {},
              widget: Image.asset(
                'assets/images/baskect.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
