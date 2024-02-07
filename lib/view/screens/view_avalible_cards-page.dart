import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/cart/pay_methos-details.dart';

class ViewAvailableCards extends StatelessWidget {
  const ViewAvailableCards({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAvailableCardsController());

    return Scaffold(body: GetBuilder<ViewAvailableCardsController>(
      builder: (controller) {
        // controller.getAllAddresses();
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            const CustomViewAvailableCardsAppbar(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: Dimensions.getHeight(context) * .75,
                child: controller.cards.isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "123".tr,
                                style: CustomStyle.textStyle17,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.setSelectedAddress(index),
                                  child: CustomUserCartDetailes(
                                    cardModel: controller.cards[index],
                                    isSelected:
                                        controller.isAddressSelected(index),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : Text(
                        "124".tr,
                        style: CustomStyle.textStyle17,
                      )),
            CustomButton(
                buttonName: "125".tr,
                onPressed: () => controller.goToAddNewCard(),
                backgroundColor: const Color(0xff9775FA),
                width: double.infinity - 20,
                height: 40),
          ]),
        );
      },
    ));
  }
}

class CustomViewAvailableCardsAppbar
    extends GetView<ViewAvailableCardsController> {
  const CustomViewAvailableCardsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () => controller.goBack(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(
          width: 75,
        ),
        Text(
          "122".tr,
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
