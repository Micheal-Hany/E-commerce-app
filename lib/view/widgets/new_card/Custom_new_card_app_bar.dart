import 'package:flutter/material.dart';
import 'package:store_app/controller/Add_new_card_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomNewCardAppBar extends StatelessWidget {
  const CustomNewCardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AddNewcardController>(
          builder: (controller) {
            return CustomCartIcon(
              backgroundColor: const Color(0xffFEFEFE),
              onPressed: () => controller.backToPaymentPage(),
              widget: const Icon(Icons.arrow_back_rounded),
            );
          },
        ),
        SizedBox(
          width: Dimensions.getWidth(context) / 4.3,
        ),
        Text(
          "87".tr,
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
