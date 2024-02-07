import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomPaymentcardAppBar extends StatelessWidget {
  const CustomPaymentcardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CreditCardController());
    return Row(
      children: [
        GetBuilder<CreditCardController>(
          builder: (controller) {
            return CustomCartIcon(
              backgroundColor: const Color(0xffFEFEFE),
              onPressed: () {
                controller.backTocartPage();
              },
              widget: const Icon(Icons.arrow_back_rounded),
            );
          },
        ),
        SizedBox(
          width: Dimensions.getWidth(context) / 3.7,
        ),
        Text(
          "86".tr,
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
