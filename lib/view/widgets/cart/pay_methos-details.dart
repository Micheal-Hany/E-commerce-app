import 'package:flutter/material.dart';

import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';



class CustomUserCardDetailes extends StatelessWidget {
  const CustomUserCardDetailes({
    Key? key,
    required this.cardNumber,
  }) : super(key: key);

  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    Get.find<ViewAvailableCardsController>();
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/cart_image.jpg")),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    "112".tr,
                    style: context.bodySmall!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Text(
                  cardNumber,
                  style: context.bodySmall!.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
