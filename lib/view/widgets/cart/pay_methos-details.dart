import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/cart_model.dart';
import 'package:get/get.dart';

class CustomUserCartDetailes extends StatelessWidget {
  const CustomUserCartDetailes({
    Key? key,
    // required this.cardNumber,
    required this.isSelected,
    required this.cardModel,
  }) : super(key: key);
  final bool isSelected;
  // final String cardNumber;
  final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ViewAvailableCardsController());
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
                    "Visa Classic",
                    style: context.bodySmall!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Text(
                  cardModel.cardNumber,
                  // "${cardNumber.substring(0, 4)} **** **** ${cardNumber.substring(14)}",
                  style: context.bodySmall!.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          !isSelected
              ? GetBuilder<ViewAvailableCardsController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.removeCard(cardModel);
                        controller.getAllCards();
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
                    );
                  },
                )
              : const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                )
        ],
      ),
    );
  }
}

class CustomUserCardDetailes extends StatelessWidget {
  const CustomUserCardDetailes({
    Key? key,
    required this.cardNumber,
    // required this.isSelected, required this.cardModel,
  }) : super(key: key);
  // final bool isSelected;
  final String cardNumber;
  // final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ViewAvailableCardsController());
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
                  // "${cardNumber.substring(0, 4)} **** **** ${cardNumber.substring(14)}",
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
