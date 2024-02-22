import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/view_avalible_cards/CustomUserCartDetailes.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ViewAvailableCardsController>();

    return SizedBox(
        height: Dimensions.getHeight(context) * .75,
        child: GetBuilder<ViewAvailableCardsController>(
          builder: (controller) {
            return controller.cards.isNotEmpty
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "123".tr,
                            style: context.bodySmall!.copyWith(fontSize: 17),
                          ),
                        ],
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cards.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () => controller.setSelectedAddress(index),
                              child: CustomUserCardDetailesView(
                                cardModel: controller.cards[index],
                                isSelected: controller.isAddressSelected(index),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      "124".tr,
                      style: context.bodySmall!.copyWith(fontSize: 17),
                    ),
                  );
          },
        ));
  }
}
