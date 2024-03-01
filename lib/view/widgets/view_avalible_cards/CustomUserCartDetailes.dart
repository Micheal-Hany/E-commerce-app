import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/class/card_model.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';

class CustomUserCardDetailesView extends StatelessWidget {
  const CustomUserCardDetailesView({
    Key? key,
    required this.isSelected,
    required this.cardModel,
  }) : super(key: key);
  final bool isSelected;
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
