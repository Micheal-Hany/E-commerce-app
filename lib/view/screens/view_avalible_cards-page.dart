import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/view_avalible_cards/CustomViewAvailableCardsAppbar.dart';
import 'package:store_app/view/widgets/view_avalible_cards/card_list.dart';

class ViewAvailableCards extends StatelessWidget {
  const ViewAvailableCards({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewAvailableCardsController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CustomViewAvailableCardsAppbar(),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const CardList(),
            CustomButton(
              buttonName: "125".tr,
              onPressed: () => controller.goToAddNewCard(),
              backgroundColor: const Color(0xff9775FA),
              width: double.infinity - 20,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}


