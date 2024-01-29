import 'package:flutter/material.dart';
import 'package:store_app/controller/Add_new_card_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/new_card/card_type_widget.dart';

class CustomCardTypeListView extends StatelessWidget {
  const CustomCardTypeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewcardController>(
      builder: (controller) {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomCardType(
                  imageUrl: controller.cards[index],
                  onTap: () {
                    controller.setSelectedTypeCard(index);
                  },
                  isSelected: controller.isCardSelected(index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
